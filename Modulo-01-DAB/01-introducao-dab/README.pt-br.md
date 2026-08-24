[English](README.md) | [Português (Brasil)](README.pt-br.md)

# Lab 01: Introdução ao Data API Builder (DAB)

O Data API Builder (DAB) é um motor de código aberto desenvolvido pela Microsoft que cria endpoints REST e GraphQL instantaneamente a partir de um banco de dados subjacente (como Azure SQL, SQL Server, PostgreSQL, MySQL e Cosmos DB).

Neste laboratório, o foco é compreender as configurações estruturais do DAB no projeto principal.

## Como o DAB se conecta ao SQL Server?

O arquivo central da aplicação é o `dab-config.json`. Dentro dele, a estrutura `data-source` gerencia o apontamento da base de dados. Em nosso projeto principal, para evitar a inserção de credenciais de banco diretamente no arquivo, referenciamos variáveis de ambiente:

```json
"data-source": {
    "database-type": "mssql",
    "connection-string": "@env('DATABASE_CONNECTION_STRING')"
}
```

O prefixo `@env(...)` indica ao DAB para interceptar e utilizar variáveis configuradas no ambiente local (fornecidas pelo nosso orquestrador Docker Compose).

## Mapeamento de Entidades

O ponto chave do exame envolve como os objetos do banco (tabelas, views ou procedures) são transformados em rotas de API. Isso é configurado no nó `entities`.

Veja a configuração para a nossa entidade de Produtos:

```json
"entities": {
    "Product": {
        "source": {
            "object": "dbo.Products",
            "type": "table"
        },
        ...
    }
}
```

- **Nome da Entidade (`Product`)**: Define o nome do endpoint REST (ex: `/api/Product`) e o tipo no GraphQL.
- **`object`**: O nome físico do objeto no banco de dados (neste caso, `dbo.Products`).
- **`type`**: O tipo de objeto do banco, que pode ser `table`, `view` ou `stored-procedure`.

## Executando na Prática

1. Volte para a raiz do repositório e inicie o menu interativo (`start-lab.bat` no Windows ou `./start-lab.sh` no Linux/Mac).
2. Escolha a opção **1** (Lab 01 - Introdução).
3. Após o ambiente iniciar, abra o arquivo `requests.http` desta mesma pasta para testar, ou acesse a interface Swagger em `http://localhost:5000/swagger`.
4. Navegue pela documentação interativa e visualize como a entidade `Product` foi transformada em operações GET, POST, PUT, PATCH e DELETE automaticamente, apenas declarando o mapeamento acima.
