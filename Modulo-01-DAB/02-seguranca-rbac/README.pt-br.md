[English](README.md) | [Português (Brasil)](README.pt-br.md)

# Lab 02: Segurança, RBAC e Simulador (Simulator)

Um dos pontos fortes do Data API Builder é o seu modelo de autorização integrado. O DAB não expõe nenhuma entidade por padrão; o acesso deve ser explicitamente concedido via permissões.

## Autenticação vs. Autorização no DAB

Em produção, o DAB geralmente é configurado com provedores de autenticação como *Static Web Apps* ou *Entra ID (Antigo Azure AD)*. Para facilitar o desenvolvimento e testes locais, o DAB possui um provedor embutido chamado **Simulator**.

Isso está definido no arquivo `dab-config.json`:

```json
"host": {
    "mode": "development",
    "authentication": {
        "provider": "Simulator"
    }
}
```

O Simulator nos isenta de gerenciar JWTs. Em vez disso, informamos o perfil (role) desejado enviando o cabeçalho HTTP:
`X-MS-API-ROLE: <nome-do-perfil>`

## Role-Based Access Control (RBAC)

Dentro das definições de uma entidade, utilizamos a seção `permissions` para autorizar ações (`actions`). 

```json
"permissions": [
    {
        "role": "anonymous",
        "actions": ["read"]
    },
    {
        "role": "authenticated",
        "actions": ["read", "create"]
    },
    {
        "role": "admin",
        "actions": ["*"]
    }
]
```

- `anonymous`: Aplicado quando nenhuma identidade/autenticação é fornecida.
- `authenticated`: Papel assumido por todos os usuários autenticados.
- `admin` (ou nomes customizados): Permissões designadas especificamente para certos níveis hierárquicos.
- Ações permitidas (`actions`): Podem ser `create`, `read`, `update`, `delete`, `execute` ou `*` (todas as anteriores).

## Teste Prático

1. Volte para a raiz do repositório e inicie o menu interativo (`start-lab.bat` no Windows ou `./start-lab.sh` no Linux/Mac).
2. Escolha a opção **2** (Lab 02 - Segurança).
3. Após o ambiente iniciar, abra o arquivo `requests.http` desta mesma pasta.
4. Envie a requisição com o cabeçalho `X-MS-API-ROLE: anonymous` tentando executar um método `POST`. Observe a resposta bloqueadora `403 Forbidden` devido à falta de autorização.
5. Em seguida, envie a requisição com `X-MS-API-ROLE: admin` (ou authenticated) e note como a operação de criar (`POST`) passa a funcionar com retorno de sucesso (`201 Created`).
