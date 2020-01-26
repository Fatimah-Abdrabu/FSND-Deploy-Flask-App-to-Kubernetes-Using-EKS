# FROM python:stretch
# FROM python:3.7.6-stretch
FROM python:3.6-slim-stretch

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]

#CMD ["gunicorn", "-b", ":8080", "main:APP"]

