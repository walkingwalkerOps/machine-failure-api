FROM python:3.13-slim
WORKDIR /app
COPY requirements-api.txt .
RUN  pip install --no-cache-dir -r requirements-api.txt
COPY requirements.txt app.py model.joblib ./
EXPOSE 8000
Run useradd --create-home appuser
USER appuser
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
