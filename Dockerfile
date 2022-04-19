FROM python:3.8

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/* \
    

WORKDIR /usr/src/app
# COPY requirements.txt ./
COPY ./app .
RUN pip install -r req.txt
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
