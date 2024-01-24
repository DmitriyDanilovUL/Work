FROM python:3.6

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

RUN export FLASK_APP=app.py

RUN export POSTGRESQL_URL=postgresql://worker:worker@192.168.56.10:5432/db

ENTRYPOINT ["/app/docker-entrypoint.sh"]



