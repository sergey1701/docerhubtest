#!/bin/sh

python3 manage.py collectstatic
python3 manage.py migrate  
gunicorn app.wsgi:application --bind 0.0.0.0:8000
# python manage.py run server 0.0.0.0:8000