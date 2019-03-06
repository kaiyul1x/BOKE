FROM python:3.6

WORKDIR /usr/src/app

COPY . .

RUN pip install -r requirements.txt -i https://pypi.doubanio.com/simple/

CMD gunicorn -w 2 -b 0.0.0.0:8000 mysite.wsgi