#!/bin/sh

python manage.py migrate --no-inputs
python manage.py run server 0.0.0.0:8000