FROM ubuntu:bionic

WORKDIR /usr/src/app

COPY ./requirements.txt ./
RUN apt update && apt install -y python-pip
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install mysqlclient

COPY . .

RUN apt update && apt install -y sqlite3
