# vaultctl.py

from fastapi import APIRouter

router = APIRouter()

@router.get("/health")
async def healthcheck():
    return {"status": "vaultctl ready"}

# Future endpoints will go below
