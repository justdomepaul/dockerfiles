FROM ubuntu:trusty

RUN apt-get update && apt-get install -y \
	trac \
	&& rm -rf /var/lib/apt/list/*

RUN easy_install --upgrade Trac==1.0.8

RUN mkdir /repo
WORKDIR /repo
