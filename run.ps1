
$venvDir = "myenv"
$env:OPENAI_API_KEY = "your_api_key"

if (!(Test-Path $venvDir)) {
    python -m venv $venvDir
}

& "$venvDir\Scripts\Activate.ps1"
python.exe -m pip install --upgrade pip
pip install -r requirements.txt


python ./scripts/openAi.py

deactivate
