FROM python:bullseye

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -U -r requirements.txt

COPY /source/ .
RUN mkdir -p ./data/db
RUN mkdir -p ./data/log
COPY /data/ ../data/
COPY /lotro-com-chain.pem ./data/db/lotro-com-chain.pem


CMD [ "python", "./main.py" ]
