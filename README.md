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
│── backend/
│   ├── django_app/           # Django (models, admin, REST endpoints)
│   │   ├── django_app/
│   │   │   ├── settings.py
│   │   │   ├── urls.py
│   │   │   └── wsgi.py
│   │   └── manage.py
│   │
│   ├── fastapi_app/          # FastAPI microservice
│   │   ├── main.py
│   │   └── requirements.txt
│   │
│   ├── requirements.txt      # Shared backend requirements
│   └── Dockerfile
│
│── infra/
│   ├── ecs-fargate/          # Terraform/CDK infra
│   ├── docker-compose.yml    # Local dev setup
│   └── nginx/                # Reverse proxy (optional)
│
│── .github/workflows/        # CI/CD pipelines
│── README.md
~~~
