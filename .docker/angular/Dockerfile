FROM debian:latest

RUN apt-get update &&\ 
    apt-get install -y --no-install-recommends apt-utils

# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

VOLUME "/home/project"
WORKDIR "/home/project"

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

RUN apt install -y --no-install-recommends nodejs
RUN apt install -y --no-install-recommends npm
RUN npm install -y --no-install-recommends pm2 -g
RUN npm install -y --no-install-recommends pm2-logrotate
RUN npm install -y --no-install-recommends @angular/cli -g
RUN export NG_CLI_ANALYTICS="false"
ARG NG_CLI_ANALYTICS="false"
ENV NG_CLI_ANALYTICS="false"
#RUN ng analytics disable
#RUN ng analytics on
