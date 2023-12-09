FROM python:bullseye

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -U -r requirements.txt

COPY /source/ .
copy /data/ ../data/
RUN mkdir -p ./data/db
RUN mkdir -p ./data/log

CMD [ "python", "./main.py" ]
