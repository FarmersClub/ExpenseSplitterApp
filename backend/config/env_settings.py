from pydantic_settings import BaseSettings
from typing import List

class Settings(BaseSettings):
    debug: bool
    secret_key: str

    db_name: str
    db_user: str
    db_password: str
    db_host: str
    db_port: int

    allowed_hosts: List[str]  # <-- new field

    class Config:
        env_file = ".env"

settings = Settings()
