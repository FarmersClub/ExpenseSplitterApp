# ExpenseSplitterApp

Splitwise but better and no ads (for now)!

### Suggested Repo Structure
~~~
ExpenseSplitterApp/
│── frontend/                 # React + Tailwind app
│   ├── src/
│   ├── public/
│   ├── package.json
│   ├── tailwind.config.js
│   └── Dockerfile
│

├── backend/                  # Backend services
│   ├── api/                  # FastAPI service
│   │   ├── main.py          # FastAPI entry point
│   │   └── routers/         # API route definitions
│   ├── config/              # Django configuration
│   │   ├── settings.py      # Django settings
│   │   ├── env_settings.py  # Environment-based settings
│   │   └── urls.py          # URL routing
│   ├── expenses/            # Django app for expenses
│   ├── manage.py            # Django management script
│   ├── main.py              # Application entry point
│   ├── pyproject.toml       # Python dependencies
│   ├── .env.example         # Example environment variables
│   └── README.md            # Backend documentation
│
│── infra/
│   ├── ecs-fargate/          # Terraform/CDK infra
│   ├── docker-compose.yml    # Local dev setup
│   └── nginx/                # Reverse proxy (optional)
│
│── .github/workflows/        # CI/CD pipelines
│── README.md
└── .gitignore               # Git ignore rules
```

## Technology Stack

### Backend
- **Django**: Web framework for models and admin interface
- **FastAPI**: High-performance API framework
- **PostgreSQL**: Database for persistent storage
- **Pydantic**: Data validation and settings management

### Frontend (Planned)
- TODO: Add frontend description

## Getting Started

### Prerequisites
- Python 3.13+
- PostgreSQL
- uv (Python package manager)

### Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Set up environment variables:
   ```bash
   cp .env.example .env
   ```
   Edit the `.env` file with your database credentials and other settings.

3. Install dependencies:
   ```bash
   uv sync
   ```

4. Run migrations:
   ```bash
   uv run python manage.py migrate
   ```

5. Start the FastAPI server:
   ```bash
   uv run uvicorn api.main:app --reload
   ```

6. Access the API documentation at http://localhost:8000/docs
