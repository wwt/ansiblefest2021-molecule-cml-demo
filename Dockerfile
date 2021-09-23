FROM python:3.9-slim-buster

RUN apt update
RUN apt -y install git
RUN apt -y install gcc
RUN apt -y install sshpass
RUN apt -y install curl
RUN pip install --upgrade pip
WORKDIR /root
ADD requirements.txt /root/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
