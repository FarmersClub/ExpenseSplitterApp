import os, django
from fastapi import FastAPI
from .routers import expenses

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings")
django.setup()

app = FastAPI(title="Expense Splitter API")
app.include_router(expenses.router, prefix="/expenses", tags=["expenses"])
