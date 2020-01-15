FROM ubuntu:18.04
WORKDIR /home
COPY scripts scripts
COPY install.sh install.sh
RUN apt-get update && apt-get install -y \
  curl