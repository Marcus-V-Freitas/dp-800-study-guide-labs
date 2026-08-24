@echo off
setlocal
cd /d "%~dp0"

IF NOT EXIST ".env" (
    echo Criando arquivo .env padrao...
    echo # SQL Server Configuration> .env
    echo ACCEPT_EULA=Y>> .env
    echo MSSQL_SA_PASSWORD=YourStrong@Password123!>> .env
    echo MSSQL_DATABASE=DemoDb>> .env
    echo MSSQL_PORT=1433>> .env
    echo.>> .env
    echo # Data API Builder Configuration>> .env
    echo DAB_PORT=5000>> .env
)

:menu
cls
echo ==================================================
echo      Microsoft DP-800 - Menu de Laboratorios
echo ==================================================
echo.
echo === Modulo 01: Data API Builder (DAB) ===
echo 1) Lab 01 - Introducao ao DAB
echo 2) Lab 02 - Seguranca e RBAC
echo 3) Lab 03 - GraphQL API
echo 4) Lab 04 - REST e OData
echo.
echo === Opcoes de Controle ===
echo 9) Parar TODOS os laboratorios em execucao
echo 0) Sair
echo ==================================================
set /p option="Opcao: "

if "%option%"=="1" set "lab_path=Modulo-01-DAB\01-introducao-dab" & goto run
if "%option%"=="2" set "lab_path=Modulo-01-DAB\02-seguranca-rbac" & goto run
if "%option%"=="3" set "lab_path=Modulo-01-DAB\03-graphql-api" & goto run
if "%option%"=="4" set "lab_path=Modulo-01-DAB\04-rest-odata" & goto run
if "%option%"=="9" goto stopall
if "%option%"=="0" exit /b 0

goto menu

:run
echo.
echo [1/2] Parando qualquer laboratorio ativo para evitar conflitos...
docker compose --env-file .env -f Modulo-01-DAB\01-introducao-dab\docker-compose.yml down -v 2>nul
docker compose --env-file .env -f Modulo-01-DAB\02-seguranca-rbac\docker-compose.yml down -v 2>nul
docker compose --env-file .env -f Modulo-01-DAB\03-graphql-api\docker-compose.yml down -v 2>nul
docker compose --env-file .env -f Modulo-01-DAB\04-rest-odata\docker-compose.yml down -v 2>nul
echo [2/2] Iniciando o laboratorio selecionado...
cd %lab_path%
docker compose --env-file ..\..\.env up -d
echo.
echo ==================================================
echo Ambiente pronto! Voce ja pode executar os testes no arquivo requests.http
echo Pressione qualquer tecla para voltar ao menu...
pause >nul
cd /d "%~dp0"
goto menu

:stopall
echo.
echo Parando todos os laboratorios...
docker compose --env-file .env -f Modulo-01-DAB\01-introducao-dab\docker-compose.yml down -v 2>nul
docker compose --env-file .env -f Modulo-01-DAB\02-seguranca-rbac\docker-compose.yml down -v 2>nul
docker compose --env-file .env -f Modulo-01-DAB\03-graphql-api\docker-compose.yml down -v 2>nul
docker compose --env-file .env -f Modulo-01-DAB\04-rest-odata\docker-compose.yml down -v 2>nul
echo Feito! Pressione qualquer tecla para voltar ao menu...
pause >nul
goto menu
