FROM ubuntu:latest

ENV TZ=America/New_York
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \
 build-essential \
 apt-transport-https \
 gnupg2 \
 git \
 make \
 gcc \
 g++ \
 apache2 \
 r-base \
 rsync \
 python3-setuptools \
 python3-pip \
 vim \
 wget

RUN mkdir -p /home/src/kentUtils/ && \
 rsync -aP rsync://hgdownload.soe.ucsc.edu/genome/admin/exe/linux.x86_64/ /home/src/kentUtils/.

WORKDIR /home

COPY . /home/.
RUN make install
