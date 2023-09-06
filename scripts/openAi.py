from langchain.llms import OpenAI
from langchain.chat_models import ChatOpenAI

llm = OpenAI()
chat_model = ChatOpenAI()

text = "What would be a good company name for a company that makes colorful socks?"

print("LLM:")
llm_response = llm.predict(text)
print(llm_response)

print("chat_model:")
chat_model_response = chat_model.predict(text)
print(chat_model_response)