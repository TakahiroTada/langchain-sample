
$venvDir = "myenv"
$env:OPENAI_API_TYPE = "azure"
$env:OPENAI_API_KEY = "<AZURE_OPENAI_API_KEY>"
$env:OPENAI_API_BASE = "<AZURE_OPENAI_API_BASE>"


if (!(Test-Path $venvDir)) {
    python -m venv $venvDir
}

& "$venvDir\Scripts\Activate.ps1"
python.exe -m pip install --upgrade pip
pip install -r requirements.txt


python ./scripts/openAi.py

deactivate
