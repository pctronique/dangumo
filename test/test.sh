#!/bin/bash

NODE_FOLDER_PROJECT=${0%/*}

NODE_NAME_PROJECT=projectest

if [ -z ${NODE_FOLDER_PROJECT} ]
then
    NODE_FOLDER_PROJECT=/home/project/www/
fi

if [ -z ${NODE_NAME_PROJECT} ]
then
    NODE_NAME_PROJECT=project
fi

VAR_NAME_DEF=$(sed -ne "0,/\\\"name\": \".*\",/s//\0/p" ${NODE_FOLDER_PROJECT}/package.json)
VAR_MODIF_NAME="\"name\": \"${NODE_NAME_PROJECT}\","

VAR_NAME_DEL=$(echo "${VAR_NAME_DEF}" | sed -e 's/"name": //g' -e 's/"//g' -e 's/,//g')

if [ -e ${NODE_FOLDER_PROJECT}/package.json ]
then
  sed -i "s/${VAR_NAME_DEF}/${VAR_MODIF_NAME}/i" "${NODE_FOLDER_PROJECT}/package.json"
fi

if [ -e ${NODE_FOLDER_PROJECT}/package-lock.json ]
then
  sed -i "s/${VAR_NAME_DEF}/${VAR_MODIF_NAME}/i" "${NODE_FOLDER_PROJECT}/package-lock.json"
fi

if [ -e ${NODE_FOLDER_PROJECT}/README.md ]
then
  sed -i "s/# ${VAR_NAME_DEL}/# ${NODE_NAME_PROJECT}/i" "${NODE_FOLDER_PROJECT}/README.md"
fi

if [ -e ${NODE_FOLDER_PROJECT}/src/index.html ]
then
  sed -i "s/<title>${VAR_NAME_DEL}/<title>${NODE_NAME_PROJECT}/i" "${NODE_FOLDER_PROJECT}/src/index.html"
fi

if [ -e ${NODE_FOLDER_PROJECT}/src/app/app.component.ts ]
then
  sed -i "s/title = '${VAR_NAME_DEL}';/title = '${NODE_NAME_PROJECT}';/i" "${NODE_FOLDER_PROJECT}/src/app/app.component.ts"
fi

if [ -e ${NODE_FOLDER_PROJECT}/src/app/app.component.ts ]
then
  sed -i "s/should have the '${VAR_NAME_DEL}' title/should have the '${NODE_NAME_PROJECT}' title/i" "${NODE_FOLDER_PROJECT}/src/app/app.component.spec.ts"
  sed -i "s/expect(app.title).toEqual('${VAR_NAME_DEL}')/expect(app.title).toEqual('${NODE_NAME_PROJECT}')/i" "${NODE_FOLDER_PROJECT}/src/app/app.component.spec.ts"
  sed -i "s/toContain('Hello, ${VAR_NAME_DEL}')/toContain('Hello, ${NODE_NAME_PROJECT}')/i" "${NODE_FOLDER_PROJECT}/src/app/app.component.spec.ts"
fi

if [ -e ${NODE_FOLDER_PROJECT}/angular.json ]
then
  sed -i "s/\"${VAR_NAME_DEL}\":/\"${NODE_NAME_PROJECT}\":/i" "${NODE_FOLDER_PROJECT}/angular.json"
  sed -i "s/\"outputPath\": \"dist\/${VAR_NAME_DEL}\"/\"outputPath\": \"dist\/${NODE_NAME_PROJECT}\"/i" "${NODE_FOLDER_PROJECT}/angular.json"
  sed -i "s/\"buildTarget\": \"${VAR_NAME_DEL}:build:production\"/\"buildTarget\": \"${NODE_NAME_PROJECT}:build:production\"/i" "${NODE_FOLDER_PROJECT}/angular.json"
  sed -i "s/\"buildTarget\": \"${VAR_NAME_DEL}:build:development\"/\"buildTarget\": \"${NODE_NAME_PROJECT}:build:development\"/i" "${NODE_FOLDER_PROJECT}/angular.json"
  sed -i "s/\"buildTarget\": \"${VAR_NAME_DEL}:build\"/\"buildTarget\": \"${NODE_NAME_PROJECT}:build\"/i" "${NODE_FOLDER_PROJECT}/angular.json"
fi

exit 0

