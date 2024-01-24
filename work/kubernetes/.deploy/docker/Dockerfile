FROM python:3.6-slim

EXPOSE  5000

ENV POSTGRESQL_URL=postgresql://user:pass@host:port/db

ENV FLASK_APP=app

COPY --chown=worker:worker /app /app

WORKDIR /app

RUN useradd -rms /bin/bash worker && chown -R worker:worker /app && chmod 700 /app

RUN pip --no-cache-dir install -r requirements.txt && \
    pip --no-cache-dir install psycopg2-binary==2.9.5


USER worker

ENTRYPOINT [ "/bin/bash", "/app/docker-entrypoint.sh" ]