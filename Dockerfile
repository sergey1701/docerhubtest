FROM python:3.8

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/* \
    && pip install django

WORKDIR /usr/src/app
# COPY requirements.txt ./
# RUN pip install -r requirements.txt
COPY ./app .
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
