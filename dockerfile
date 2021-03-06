# syntax=docker/dockerfile:1

FROM ubuntu:latest

RUN apt update
RUN apt install -y software-properties-common gcc
RUN add-apt-repository -y ppa:deadsnakes/ppa

RUN apt-get update
RUN apt-get install -y python3.10 python3-distutils python3-pip python3-apt
RUN mkdir /db

WORKDIR /app

COPY ./app ./app

COPY ./requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

EXPOSE 8080

COPY ./start.sh start.sh

COPY ./run.py run.py

CMD ["./start.sh"]