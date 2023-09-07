
$venvDir = "venv"

$env:OPENAI_API_TYPE = "azure"
$env:OPENAI_API_KEY = ""
$env:OPENAI_API_BASE = ""
$env:OPENAI_LLM_DEPLOYMENT_NAME = ""
$env:OPENAI_LLM_MODEL_NAME = ""
$env:OPENAI_EMBEDDING_DEPLOYMENT_NAME = ""
$env:OPENAI_EMBEDDING_MODEL_NAME = ""

if (!(Test-Path $venvDir)) {
    python -m venv $venvDir
}

& "$venvDir\Scripts\Activate.ps1"
python.exe -m pip install --upgrade pip
pip install -r requirements.txt