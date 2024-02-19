FROM python:3.10

# Выбор папки, в которой будет вестись работа
WORKDIR /track-service

COPY ./requirements.txt /track-service/
RUN pip install --no-cache-dir -r /track-service/requirements.txt

COPY ./app /track-service/app
COPY ./alembic /track-service/alembic
COPY ./alembic.ini /track-service/alembic.ini

EXPOSE 80

CMD ["/bin/sh", "-c", \
    "uvicorn app.main:app --host 0.0.0.0 --port 80"]
