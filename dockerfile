FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -U -r requirements.txt

COPY /source/ .
copy /data/ ../data/
RUN mkdir ./data/db
RUN mkdir ./data/log

CMD [ "python", "./main.py" ]
