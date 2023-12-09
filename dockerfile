FROM python:bullseye

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -U -r requirements.txt

COPY /source/ .
RUN mkdir -p ./data/db
RUN mkdir -p ./data/log
COPY /data/ ../data/
COPY /source/lotro-com-chain.pem ./data/db


CMD [ "python", "./main.py" ]
