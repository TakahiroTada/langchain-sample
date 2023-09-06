import os
from langchain.llms import OpenAI

# Azure OpenAI API認証情報の設定
os.environ["OPENAI_API_TYPE"] = "azure"
os.environ["OPENAI_API_KEY"] = "<AZURE_OPENAI_API_KEY>"
os.environ["OPENAI_API_BASE"] = "<AZURE_OPENAI_API_BASE>"

# GPTモデル情報（デプロイ名）
DEPLOYMENT_NAME = "<AZURE_OPENAI_API_DEPLOYMENT_NAME>"

# LangChain Modelの作成
llm = OpenAI(model_name='text-davinci-003', model_kwargs={"deployment_id": DEPLOYMENT_NAME})

# LangChain Modelの実行
print(llm("面白い事をいってください。"))