FROM node:latest

RUN apt-get update &&\ 
    apt-get install -y --no-install-recommends apt-utils

VOLUME "/home/project"
WORKDIR "/home/project"

ENV PATH /app/node_modules/.bin:$PATH

RUN npm install -y --no-install-recommends @angular/cli -g
RUN export NG_CLI_ANALYTICS="false"
ARG NG_CLI_ANALYTICS="false"
ENV NG_CLI_ANALYTICS="false"
