#!/bin/bash

docker volume create --name jenkins2_data

docker service create --name BSSCI2 \
        --publish  8080:8080 \
        --publish  9091:9091 \
        --mount src=jenkins2_data,dst=/var/jenkins_home \
        --env JAVA_OPTS=-Duser.timezone=Asia/Taipei \
        --user root \
        jenkins:2.7.3
