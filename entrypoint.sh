#!/bin/bash
python manage.py migrate --no-inputs || exit 1
python manage.py run server 0.0.0.0:8000