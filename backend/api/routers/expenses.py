from fastapi import APIRouter
from config.env_settings import settings

router = APIRouter()

@router.get("/")
def list_expenses():
    return {"message": "List of expenses"}
