[English](README.md) | [Português (Brasil)](README.pt-br.md)

# Lab 04: REST Patterns and OData Filters

Data API Builder's ability to instantly expose REST endpoints compliant with the OData specification provides a substantial productivity boost.

## Endpoints and Operations

As soon as an entity (e.g., `Product`) is configured in `dab-config.json` and DAB starts, the following HTTP methods and routes are automatically available:

- `GET /api/Product`: Retrieve a paginated list of products (requires `read` action).
- `GET /api/Product/Id/1`: Retrieve a specific product by its primary key.
- `POST /api/Product`: Create a new product (requires `create` action).
- `PUT /api/Product/Id/1`: Fully replace product with primary key 1 (requires `update` action).
- `PATCH /api/Product/Id/1`: Partially update a product (e.g., update price only).
- `DELETE /api/Product/Id/1`: Delete a record (requires `delete` action).

## Intelligent Data Retrieval (OData)

A standout capability in DAB is query string filtering, eliminating the need to write heavy stored procedures in SQL Server for advanced queries. The engine translates OData-style URL parameters into optimized T-SQL statements.

### 1. Advanced Filters (`$filter`)
Use `$filter` with operators such as `eq`, `gt`, `lt`, `and`, `or`, and `startswith`:

```http
GET /api/Product?$filter=Price gt 500
GET /api/Product?$filter=Name eq 'Mouse' and Price lt 200
```

### 2. Sorting (`$orderby`)
Used to control sort direction (`asc` for ascending, `desc` for descending):

```http
GET /api/Product?$orderby=Price desc
```

### 3. Selection and Pagination (`$select`, `$first`, `$after`)
Fetching an entire database table at once is a poor practice; DAB enforces pagination.

- **`$select`**: Selects specific columns (similar to GraphQL payload reduction):
  `GET /api/Product?$select=Name,Price`
- **`$first=N`**: Equivalent to SQL "TOP N", fetching only the first N items.
- **`$after`**: Used for cursor-based pagination continuation tokens.

## Hands-on Testing

1. Start the lab via the interactive menu in the root (`start-lab.bat` or `./start-lab.sh`), choosing option **4** (Lab 04 - REST).
2. Open the `requests.http` file located in this folder.
3. Test the requests under the OData section. Combine `$filter` and `$orderby` in the same request. If desired, inspect the SQL Server container logs via Docker Desktop to see how DAB compiles OData parameters into native, performant `WHERE` clauses in SQL Server!
