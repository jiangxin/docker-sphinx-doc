FROM debian:latest

MAINTAINER Jiang Xin worldhello.net@gmail.com

RUN echo 'Acquire::http { Proxy "http://192.168.64.10:9999"; };' > /etc/apt/apt.conf.d/80proxy \
    && mv /etc/apt/sources.list /etc/apt/sources.list.pristine \
    && echo 'deb http://mirrors.163.com/debian/ jessie main contrib non-free' > /etc/apt/sources.list \
    && apt-get update && apt-get install -y git make python-sphinx && apt-get clean \
    && rm -f /etc/apt/apt.conf.d/80proxy \
    && mv /etc/apt/sources.list.pristine /etc/apt/sources.list \
    && rm -f /var/lib/apt/lists/*.*

ADD patches/* /tmp/
RUN cd /usr/share/sphinx/themes && patch -p1 < /tmp/0001-sphinx-common.patch \
    && cd /usr/lib/python2.7/dist-packages/sphinx && patch -p1 < /tmp/0002-python-sphinx.patch \
    && rm /tmp/000*.patch
