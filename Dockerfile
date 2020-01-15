FROM ubuntu:18.04
WORKDIR /home
COPY scripts scripts
COPY install.sh install.sh
RUN apt update -y
RUN apt install curl -y