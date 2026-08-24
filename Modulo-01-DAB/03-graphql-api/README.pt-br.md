[English](README.md) | [Português (Brasil)](README.pt-br.md)

# Lab 03: Consultas e Mutações GraphQL API

O Data API Builder não apenas expõe APIs RESTful, mas também um endpoint GraphQL completo, habilitado por padrão na porta `/graphql`. O GraphQL é extremamente vantajoso quando os clientes web (frontends) precisam buscar relacionamentos profundos, definindo a estrutura exata do dado de retorno sem incorrer em sobrecarga (over-fetching).

## O Endpoint

Em `dab-config.json`, o nó que comanda o GraphQL é:

```json
"runtime": {
    "graphql": {
        "enabled": true,
        "path": "/graphql"
    }
}
```

O DAB gera magicamente os esquemas GraphQL a partir do banco de dados relacional (SQL Server). Ele cria `Queries` (para leituras) e `Mutations` (para operações de escrita, como insert, update, delete).

## Estrutura Básica de Queries

As consultas baseiam-se na tipagem definida em `entities`. Para a entidade `Product` criada no projeto principal, uma query para obter a coleção ficaria assim:

```graphql
query {
  products {
    items {
      Id
      Name
      Price
    }
  }
}
```

- **`products`**: Nome pluralizado que o DAB assinala para buscas de coleção da entidade Product.
- **`items`**: Elemento paginado obrigatório do DAB GraphQL que engloba as linhas do banco.
- Ao declarar `Id`, `Name` e `Price`, nós evitamos trazer dados que não precisamos.

### Queries com Filtros

O DAB estende o GraphQL com a habilidade de filtragem nativa utilizando o argumento `filter`:

```graphql
query {
  products(filter: { Price: { gt: 1000 } }) {
    items {
      Id
      Name
    }
  }
}
```

## Prática e Testes

O Swagger (disponibilizado via `/swagger`) atende primordialmente às especificações da API REST. Para testar o GraphQL:

1. Inicie o laboratório usando o menu interativo na raiz do projeto (`start-lab.bat` ou `./start-lab.sh`), selecionando a opção **3** (Lab 03 - GraphQL).
2. Abra o arquivo `requests.http` localizado nesta mesma pasta.
3. Note as requisições `POST {{baseUrl}}/graphql` passando a chave `"query"` com uma string formatada (este é o padrão da especificação do GraphQL sobre HTTP).
4. Envie a requisição e tente alterar as chaves contidas em `items { ... }` para observar as respostas mudarem dinamicamente, sem trazer campos indesejados.
