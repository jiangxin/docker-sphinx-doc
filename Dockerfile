FROM debian:latest

MAINTAINER Jiang Xin worldhello.net@gmail.com

RUN apt-get update && apt-get install -y git make python-sphinx && apt-get clean \
    && rm -f /var/lib/apt/lists/*.*
