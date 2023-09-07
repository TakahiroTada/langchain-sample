import os
from langchain.llms import OpenAI
from langchain.chat_models import ChatOpenAI
from langchain.embeddings.openai import OpenAIEmbeddings
from langchain.vectorstores import Chroma
from langchain.text_splitter import CharacterTextSplitter
from langchain.chat_models import ChatOpenAI
from langchain.chains import ConversationalRetrievalChain
from langchain.document_loaders import PyPDFLoader

# Embeddingモデルをセットアップする
embeddings = OpenAIEmbeddings(
    deployment=os.getenv("OPENAI_EMBEDDING_DEPLOYMENT_NAME"),
    model=os.getenv("OPENAI_EMBEDDING_MODEL_NAME"),
    openai_api_base=os.getenv("OPENAI_API_BASE"),
    openai_api_type=os.getenv("OPENAI_API_TYPE"),
)

# Embeddingモデルを使って、就業規則の文章をベクトル化する
loader = PyPDFLoader("./documents/regulation.pdf")
pages = loader.load_and_split()
vectorstore = Chroma.from_documents(pages, embedding=embeddings, persist_directory=".")
vectorstore.persist()

# LLMモデルをセットアップする
llm = ChatOpenAI(model_name=os.getenv("OPENAI_LLM_MODEL_NAME"), model_kwargs={"deployment_id":os.getenv("OPENAI_LLM_DEPLOYMENT_NAME")})

query = input("なにか知りたいことがありますか？: ")

# LLMモデルに質問を投げる
chat_history = []
pdf_qa = ConversationalRetrievalChain.from_llm(llm, vectorstore.as_retriever(), return_source_documents=True)
result = pdf_qa({"question": query, "chat_history": chat_history})

# LLMモデルの回答を表示する
print(result["answer"])


