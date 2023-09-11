
$venvDir = "venv"

$env:OPENAI_API_TYPE = "azure"
$env:OPENAI_API_KEY = ""
$env:OPENAI_API_BASE = ""
$env:OPENAI_LLM_DEPLOYMENT_NAME = ""
$env:OPENAI_LLM_MODEL_NAME = ""
$env:OPENAI_EMBEDDING_DEPLOYMENT_NAME = ""
$env:OPENAI_EMBEDDING_MODEL_NAME = ""
$env:OPENAI_API_VERSION = ""
$env:OPENAI_LLM_TEMPERATURE = ""

$env:SQL_SERVER_HOST = ""
$env:SQL_SERVER_PORT = ""
$env:SQL_SERVER_DATABASE = ""
$env:SQL_SERVER_USER_NAME = ""
$env:SQL_SERVER_PASSWORD = ""
$env:SQL_SERVER_DRIVER_NAME = "ODBC Driver 17 for SQL Server"
$env:SQL_SERVER_INCLUDE_TABLES = ""

if (!(Test-Path $venvDir)) {
    python -m venv $venvDir
}

& "$venvDir\Scripts\Activate.ps1"
python.exe -m pip install --upgrade pip
pip install -r requirements.txt