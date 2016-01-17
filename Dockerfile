FROM debian:latest

MAINTAINER Jiang Xin worldhello.net@gmail.com

RUN apt-get update && apt-get install -y git make python-sphinx && apt-get clean \
    && rm -f /var/lib/apt/lists/*.*

ADD patches/* /tmp/
RUN cd /usr/share/sphinx/themes && patch -p1 < /tmp/0001-sphinx-common.patch \
    && cd /usr/lib/python2.7/dist-packages/sphinx && patch -p1 < /tmp/0002-python-sphinx.patch \
    && rm /tmp/000*.patch
