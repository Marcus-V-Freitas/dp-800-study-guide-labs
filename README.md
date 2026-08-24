[English](README.md) | [Português (Brasil)](README.pt-br.md)

# Study Guide and Labs: Microsoft DP-800

This repository was structured to scale and cover the diverse skills required by the **Microsoft DP-800** exam, providing orchestrated development environments and step-by-step guides for hands-on experimentation and learning.

---

## General Prerequisites

To follow most labs and run local environments, you will need:

1. **Docker Desktop / Rancher / Any Docker Engine** installed and running.
2. **Visual Studio Code (VS Code)**.
3. **HttpYac** or **REST Client** extension installed in VS Code to run and automate API tests directly inside the editor.

---

## How the Labs are Structured (DRY Architecture)

- Each lab in this repository is designed to be **100% self-contained**, without code repetition.

- When navigating into any lab folder, you will find only the configuration files focused on that specific topic and their tests (e.g., `requests.http`).

### How to Run (Interactive Menu)

To avoid spending time on manual commands, helper scripts are available at the root!

- Double-click **`start-lab.bat`** (Windows) or run **`./start-lab.sh`** (Linux/Mac).
- The interactive menu initializes your `.env`, tears down previous labs, and starts the new one in complete isolation.

---

## Module and Lab Index

Below is the study roadmap. New modules and folders will be added as the DP-800 track expands.

### Module 1: Data API Builder (DAB) and SQL Server

The first module covers using Azure Data API Builder with SQL Server to instantly generate secure REST and GraphQL endpoints without writing boilerplate API code. In these labs, the central study file is `dab-config.json`.

- **[Lab 01: Introduction to Data API Builder (DAB)](Modulo-01-DAB/01-introducao-dab/README.md)**
  Core concepts, `dab-config.json` setup, and entity mapping (tables and views).

- **[Lab 02: Security, RBAC, and Simulator](Modulo-01-DAB/02-seguranca-rbac/README.md)**
  Access permission structure, role management (`anonymous`, `authenticated`, `admin`), and local security testing via HTTP headers.

- **[Lab 03: GraphQL API Queries and Mutations](Modulo-01-DAB/03-graphql-api/README.md)**
  Exploring the auto-generated GraphQL API, complex queries, and graph data manipulation.

- **[Lab 04: REST Patterns and OData Filters](Modulo-01-DAB/04-rest-odata/README.md)**
  Deep dive into OData specification with DAB, covering pagination, sorting (`$orderby`), and complex filters (`$filter`).

*(New modules focused on DP-800 will be added to this index in the future...)*
