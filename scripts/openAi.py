import os
from langchain.llms import OpenAI
from langchain.chat_models import ChatOpenAI
from langchain.schema import (
    HumanMessage,
)

# GPTモデル情報（デプロイ名）
DEPLOYMENT_NAME = os.environ["MODEL_DEPLOYMENT_NAME"]   
MODEL_NAME = os.environ["MODEL_NAME"] 

# LangChain Modelの作成
chat = ChatOpenAI(model_name=MODEL_NAME, model_kwargs={"deployment_id":DEPLOYMENT_NAME})

# LangChain Modelの実行
print(chat([HumanMessage(content="Pythonを使ってなにかアプリを作りたいです。お題を出してください。")]))