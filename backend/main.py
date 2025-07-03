from fastapi import FastAPI
from vaultctl import router as vaultctl_router

app = FastAPI()

# include the vaultctl router with prefix
app.include_router(vaultctl_router, prefix="/vaultctl")

@app.get("/")
def read_root():
    return {"message": "Vault Validator backend operational"}
