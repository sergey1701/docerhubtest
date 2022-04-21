FROM python:3.8-alpine
ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app
COPY req.txt ./
RUN apk add --no-cache --virtual .build-deps \
    ca-certificates gcc postgresql-dev linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev \
    && pip install -r req.txt

COPY ./app .

EXPOSE 8000
# CMD ["python", "manage.py", "migrate"]
# CMD ["gunicorn", "app.wsgi:application", "--bind", "0.0.0.0:8000"]
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
COPY ./entrypoint.sh .
ENTRYPOINT ["sh", "-c", "./entrypoint.sh"]