FROM node:latest
RUN apt-get -y install default-jre
ARG -p 3000:3000 -u 0:0 -v /var/lib/jenkins/workspace/Docker-React/node-modules:/var/lib/jenkins/workspace/Docker-React/node-modules