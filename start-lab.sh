#!/bin/bash

# Mudar para o diretório raiz do projeto
cd "$(dirname "$0")" || exit

if [ ! -f ".env" ]; then
    echo "Criando arquivo .env padrao..."
    cat <<EOF > .env
# SQL Server Configuration
ACCEPT_EULA=Y
MSSQL_SA_PASSWORD=YourStrong@Password123!
MSSQL_DATABASE=DemoDb
MSSQL_PORT=1433

# Data API Builder Configuration
DAB_PORT=5000
EOF
fi

function stop_all() {
    echo ""
    echo "Parando qualquer laboratorio ativo para evitar conflitos..."
    docker compose --env-file .env -f Modulo-01-DAB/01-introducao-dab/docker-compose.yml down -v 2>/dev/null
    docker compose --env-file .env -f Modulo-01-DAB/02-seguranca-rbac/docker-compose.yml down -v 2>/dev/null
    docker compose --env-file .env -f Modulo-01-DAB/03-graphql-api/docker-compose.yml down -v 2>/dev/null
    docker compose --env-file .env -f Modulo-01-DAB/04-rest-odata/docker-compose.yml down -v 2>/dev/null
}

while true; do
    clear
    echo "=================================================="
    echo "     Microsoft DP-800 - Menu de Laboratorios"
    echo "=================================================="
    echo ""
    echo "=== Modulo 01: Data API Builder (DAB) ==="
    echo "1) Lab 01 - Introducao ao DAB"
    echo "2) Lab 02 - Seguranca e RBAC"
    echo "3) Lab 03 - GraphQL API"
    echo "4) Lab 04 - REST e OData"
    echo ""
    echo "=== Opcoes de Controle ==="
    echo "9) Parar TODOS os laboratorios em execucao"
    echo "0) Sair"
    echo "=================================================="
    read -p "Opcao: " option

    case $option in
        1) lab_path="Modulo-01-DAB/01-introducao-dab" ;;
        2) lab_path="Modulo-01-DAB/02-seguranca-rbac" ;;
        3) lab_path="Modulo-01-DAB/03-graphql-api" ;;
        4) lab_path="Modulo-01-DAB/04-rest-odata" ;;
        9) 
            stop_all
            echo "Feito! Pressione [Enter] para continuar..."
            read -r
            continue
            ;;
        0) exit 0 ;;
        *) continue ;;
    esac

    stop_all
    echo "Iniciando o laboratorio selecionado..."
    cd "$lab_path" || exit
    docker compose --env-file ../../.env up -d
    echo ""
    echo "=================================================="
    echo "Ambiente pronto! Voce ja pode executar os testes no arquivo requests.http"
    echo "Pressione [Enter] para voltar ao menu..."
    read -r
    cd - > /dev/null || exit
done
