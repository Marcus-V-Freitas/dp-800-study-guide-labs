[English](README.md) | [Português (Brasil)](README.pt-br.md)

# Guia de Estudos e Laboratórios: Microsoft DP-800

Este repositório foi estruturado para crescer e abranger as diversas competências exigidas pelo exame **Microsoft DP-800**, fornecendo ambientes de desenvolvimento orquestrados e guias passo a passo para experimentação e aprendizado.

---

## Pré-requisitos Gerais

Para acompanhar a maioria dos laboratórios e executar os ambientes locais, você precisará de:

1. **Docker Desktop / Rancher / Ou qualquer Engine Docker** instalado e operando.
2. **Visual Studio Code (VS Code)**.
3. Extensão **HttpYac** ou **REST Client** instalada no VS Code para executar e automatizar testes de API diretamente do editor.

---

## Como os Laboratórios são Estruturados (Arquitetura DRY)

- Cada laboratório deste repositório é desenhado para ser **100% autossuficiente**, mas sem repetição de código.

- Ao entrar na pasta de qualquer laboratório, você encontrará apenas os arquivos focados naquele tópico e seus testes (ex: `requests.http`).

### Como Executar (Menu Interativo)

Para não perder tempo com comandos manuais, existem scripts facilitadores na raiz!

- Dê um duplo clique no arquivo **`start-lab.bat`** (Windows) ou execute **`./start-lab.sh`** (Linux/Mac). 
- O Menu interativo cuida de inicializar o seu `.env`, destruir laboratórios antigos e subir a nova aula perfeitamente isolada.

---

## Índice de Módulos e Laboratórios

Abaixo está a organização dos tópicos de estudo. Novos módulos e pastas serão adicionados conforme a evolução da trilha DP-800.

### Módulo 1: Data API Builder (DAB) e SQL Server

O primeiro módulo ensina a utilizar o Azure Data API Builder em conjunto com o SQL Server para gerar instantaneamente endpoints REST e GraphQL de forma segura e sem código. Nestes laboratórios específicos, o arquivo de estudos central é o `dab-config.json`.

- **[Lab 01: Introdução ao Data API Builder (DAB)](Modulo-01-DAB/01-introducao-dab/README.pt-br.md)**
  Conceitos fundamentais, configuração do `dab-config.json` e mapeamento de entidades (tabelas e views).

- **[Lab 02: Segurança, RBAC e Simulador](Modulo-01-DAB/02-seguranca-rbac/README.pt-br.md)**
  Estruturação de permissões de acesso, uso de papéis (`anonymous`, `authenticated`, `admin`) e testes de segurança locais via cabeçalhos HTTP.

- **[Lab 03: Consultas e Mutações GraphQL](Modulo-01-DAB/03-graphql-api/README.pt-br.md)**
  Exploração da API GraphQL autogerada, queries complexas e manipulação de dados em formato de grafo.

- **[Lab 04: Padrões REST e Filtros OData](Modulo-01-DAB/04-rest-odata/README.pt-br.md)**
  Aprofundamento na especificação OData com o DAB, abordando paginação, ordenação (`$orderby`) e filtros complexos (`$filter`).

*(Novos módulos focados no DP-800 serão adicionados a este índice no futuro...)*
