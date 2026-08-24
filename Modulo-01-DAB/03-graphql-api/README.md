[English](README.md) | [Português (Brasil)](README.pt-br.md)

# Lab 03: GraphQL API Queries and Mutations

Data API Builder not only exposes RESTful APIs, but also a fully-featured GraphQL endpoint, enabled by default at `/graphql`. GraphQL is especially beneficial when client applications (frontends) need to fetch deeply nested relationships, specifying the exact response shape without over-fetching.

## The Endpoint

In `dab-config.json`, the section that configures GraphQL is:

```json
"runtime": {
    "graphql": {
        "enabled": true,
        "path": "/graphql"
    }
}
```

DAB automatically generates GraphQL schemas based on the relational database (SQL Server), generating `Queries` (for reads) and `Mutations` (for writes: insert, update, delete).

## Basic Query Structure

Queries are derived from the definitions in `entities`. For the `Product` entity, a collection query is structured as:

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

- **`products`**: Pluralized name assigned by DAB for collection queries of the Product entity.
- **`items`**: Required paginated wrapper element containing database rows.
- By requesting only `Id`, `Name`, and `Price`, you avoid transferring unnecessary fields.

### Filtered Queries

DAB extends GraphQL with native filtering using the `filter` argument:

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

## Hands-on Testing

Swagger (available at `/swagger`) primarily serves REST API specs. To test GraphQL:

1. Start the lab via the interactive menu in the root (`start-lab.bat` or `./start-lab.sh`), choosing option **3** (Lab 03 - GraphQL).
2. Open the `requests.http` file located in this folder.
3. Observe the `POST {{baseUrl}}/graphql` requests sending the `"query"` payload (standard GraphQL over HTTP specification).
4. Send the request and modify the fields within `items { ... }` to see responses adapt dynamically without returning extra data.
