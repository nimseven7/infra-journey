from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def get_root():
    return {"data": "Hello from my-fastapi!"}

@app.get("/me")
def get_me():
    return {"data": "Here I am"}
