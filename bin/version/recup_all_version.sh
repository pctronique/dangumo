#!/bin/bash
FOLDER_BASE="${0%/*}/../.."
FOLDER_DOCKER="$FOLDER_BASE/.docker"
FOLDER_ENV_DEF="$FOLDER_DOCKER/file_env"

while read line  
do   
   if [ ! -z "$line" ]
   then
      export $line
   fi
done < $FOLDER_ENV_DEF/.env

${0%/*}/recup_version_nodejs.sh
${0%/*}/recup_version_angular.sh

while read line  
do   
   if [ ! -z "$line" ]
   then
      export $line
   fi
done < "${0%/*}/../../$PROJECT_TMP_MAIN/env_version.txt"

if [ ! -f "$NODEJS_VERSION" ]
then
   sed -i "s/FROM node:latest/FROM node:$NODEJS_VERSION/" $FOLDER_DOCKER/$DOCKER_FOLDER_PROJECT/Dockerfile
fi

if [ ! -f "$ANGULAR_VERSION" ]
then
   sed -i "s/RUN npm install -y --no-install-recommends @angular\/cli -g/RUN npm install -y --no-install-recommends @angular\/cli@$ANGULAR_VERSION -g/" $FOLDER_DOCKER/$DOCKER_FOLDER_PROJECT/Dockerfile
fi

