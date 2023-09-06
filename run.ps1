
$venvDir = "myenv"
$env:OPENAI_API_TYPE = "azure"
$env:OPENAI_API_KEY = "<YOUR_AZURE_OPEN_AI_API_KEY>"
$env:OPENAI_API_BASE = "<YOUR_AZURE_OPEN_AI_BASE_URL>"
$env:MODEL_DEPLOYMENT_NAME = "<YOUR_AZURE_OPEN_AI_DEPLOYMENT_NAME>"
$env:MODEL_NAME = "<YOUR_AZURE_OPEN_AI_MODEL_NAME>"

if (!(Test-Path $venvDir)) {
    python -m venv $venvDir
}

& "$venvDir\Scripts\Activate.ps1"
python.exe -m pip install --upgrade pip
pip install -r requirements.txt


python ./scripts/openAi.py

deactivate
