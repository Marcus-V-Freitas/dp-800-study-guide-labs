[English](README.md) | [Português (Brasil)](README.pt-br.md)

# Lab 01: Introduction to Data API Builder (DAB)

Data API Builder (DAB) is an open-source engine developed by Microsoft that creates REST and GraphQL endpoints instantly from an underlying database (such as Azure SQL, SQL Server, PostgreSQL, MySQL, and Cosmos DB).

In this lab, the focus is to understand DAB structural configuration settings.

## How does DAB connect to SQL Server?

The central application file is `dab-config.json`. Inside it, the `data-source` structure manages the database connection. To avoid hardcoding database credentials directly into configuration files, environment variables are referenced:

```json
"data-source": {
    "database-type": "mssql",
    "connection-string": "@env('DATABASE_CONNECTION_STRING')"
}
```

The `@env(...)` prefix tells DAB to read and use variables configured in the local environment (provided by Docker Compose orchestration).

## Entity Mapping

A key concept involves mapping database objects (tables, views, or stored procedures) into API routes. This is configured under the `entities` section.

Here is the configuration for the Product entity:

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

- **Entity Name (`Product`)**: Defines the REST endpoint route name (e.g., `/api/Product`) and the GraphQL type name.
- **`object`**: The physical name of the object in the database (in this case, `dbo.Products`).
- **`type`**: The database object type, which can be `table`, `view`, or `stored-procedure`.

## Hands-on Execution

1. Return to the root directory and launch the interactive menu (`start-lab.bat` on Windows or `./start-lab.sh` on Linux/Mac).
2. Select option **1** (Lab 01 - Introduction).
3. Once the environment starts, open the `requests.http` file located in this folder to test requests, or open the Swagger interface at `http://localhost:5000/swagger`.
4. Explore the interactive documentation to observe how the `Product` entity is automatically exposed with GET, POST, PUT, PATCH, and DELETE operations just by declaring the mapping above.
