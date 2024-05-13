#!/bin/bash

NODE_FOLDER_PROJECT=${0%/*}

if [ -z ${NODE_FOLDER_PROJECT} ]
then
    NODE_FOLDER_PROJECT=/home/project/www/
fi

if [ -z ${NODE_NAME_PROJECT} ]
then
    NODE_NAME_PROJECT=project
fi

#angular.json
#src/app/app.component.spec.ts
#src/app/app.component.ts
#src/index.html
#README.md

VAR_NAME_DEF=$(sed -ne "0,/\\title = '.*'/s//\0/p" ${NODE_FOLDER_PROJECT}/src/app/app.component.ts)
VAR_MODIF_NAME="\"name\": \"${NODE_NAME_PROJECT}\","

#if [ -e ${NODE_FOLDER_PROJECT}/package.json ]
#then
#  sed -i "s/${VAR_NAME_DEF}/${VAR_MODIF_NAME}/" "${NODE_FOLDER_PROJECT}/package.json"
#fi

#if [ -e ${NODE_FOLDER_PROJECT}/package-lock.json ]
#then
#  sed -i "s/${VAR_NAME_DEF}/${VAR_MODIF_NAME}/" "${NODE_FOLDER_PROJECT}/package-lock.json"
#fi

echo $VAR_NAME_DEF
