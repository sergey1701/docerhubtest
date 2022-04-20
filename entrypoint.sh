#!/bin/sh

python3 manage.py migrate --no-inputs
python3 manage.py run server 0.0.0.0:8000