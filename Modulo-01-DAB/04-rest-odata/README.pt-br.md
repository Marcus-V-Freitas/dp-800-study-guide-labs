[English](README.md) | [Português (Brasil)](README.pt-br.md)

# Lab 04: Padrões REST e Filtros OData

A habilidade do Data API Builder de prover instantaneamente endpoints REST compatíveis com a especificação OData é um forte impulsionador de produtividade.

## Endpoints e Operações

Assim que uma entidade (ex: `Product`) é cadastrada em `dab-config.json` e o DAB é iniciado, os seguintes verbos HTTP e rotas passam a existir:

- `GET /api/Product`: Obter lista paginada de produtos (requer ação `read`).
- `GET /api/Product/Id/1`: Obter produto específico através de sua chave primária.
- `POST /api/Product`: Criar novo produto (requer ação `create`).
- `PUT /api/Product/Id/1`: Substituir integralmente o produto de chave primária 1 (requer ação `update`).
- `PATCH /api/Product/Id/1`: Fazer uma alteração parcial (ex: atualizar apenas preço).
- `DELETE /api/Product/Id/1`: Remover registro (requer ação `delete`).

## Extraindo Dados Inteligentes (OData)

O grande diferencial gerado no DAB são as "querystrings" de filtros que evitam a construção de Stored Procedures pesadas no SQL Server para buscas avançadas. O motor traduz parâmetros URL (estilo OData) em consultas T-SQL otimizadas.

### 1. Filtros Avançados (`$filter`)
Você utiliza o `$filter` passando operadores (como `eq`, `gt`, `lt`, `and`, `or`, `startswith`):

```http
GET /api/Product?$filter=Price gt 500
GET /api/Product?$filter=Name eq 'Mouse' and Price lt 200
```

### 2. Ordenação (`$orderby`)
Usado para ditar como o banco deve devolver a resposta (`asc` para ascendente, `desc` para descendente):

```http
GET /api/Product?$orderby=Price desc
```

### 3. Seleção e Paginação (`$select`, `$first`, `$after`)
É sempre má prática trazer 1 milhão de registros de uma vez. O DAB força paginação.

- **`$select`**: Seleciona colunas específicas (similar ao GraphQL em conceito de payload enxuto):
  `GET /api/Product?$select=Name,Price`
- **`$first=N`**: Equivale ao "TOP N" do SQL. Pega apenas os X primeiros itens.
- **`$after`**: Utilizado na continuação da paginação por cursor (cursor-based pagination).

## Teste Prático

1. Inicie o laboratório usando o menu interativo na raiz do projeto (`start-lab.bat` ou `./start-lab.sh`), selecionando a opção **4** (Lab 04 - REST).
2. Abra o arquivo `requests.http` localizado nesta mesma pasta.
3. Teste as requisições marcadas na sessão OData. Tente combinar `$filter` e `$orderby` em uma mesma requisição. Se possível, abra os logs do contêiner SQL Server (`sqlserver-lab04`) via Docker Desktop para inspecionar e constatar como o DAB converte os parâmetros OData em queries `WHERE` nativas e performáticas no banco de dados!
