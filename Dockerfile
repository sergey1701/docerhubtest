FROM python:3.8

WORKDIR /usr/src/app
COPY req.txt ./
RUN pip install -r req.txt
COPY ./app .
EXPOSE 8000
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
