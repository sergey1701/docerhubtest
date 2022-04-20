#!/bin/sh

python manage.py migrate --no-inputs
python namege.py run server 0.0.0.0:8000