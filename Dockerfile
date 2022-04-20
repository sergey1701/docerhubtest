FROM python:3.8.5-alpine
ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app
COPY req.txt ./
RUN apk add --no-cache --virtual .build-deps \
    ca-certificates gcc postgresql-dev linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev \
    && pip install -r req.txt
# RUN pip install -r req.txt
# COPY ./app .
# COPY ./entrypoint.sh .
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 8000
# CMD ["python", "manage.py", "migrate"]
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
ENTRYPOINT ["sh", "./entrypoint.sh"]
