#!/bin/bash
set -e
flask db upgrade
#python app.py

gunicorn -w 4 --bind 0.0.0.0:5000 wsgi:api
