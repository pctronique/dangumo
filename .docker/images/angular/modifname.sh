#!/bin/bash

if [ -z ${NODE_FOLDER_PROJECT} ]
then
    NODE_FOLDER_PROJECT=/home/project/www/
fi

if [ -z ${NODE_NAME_PROJECT} ]
then
    NODE_NAME_PROJECT=project
fi

VAR_NAME_DEF=$(sed -ne "0,/\\\"name\": \".*\",/s//\0/p" ${NODE_FOLDER_PROJECT}/package.json)
VAR_NAME_DEL=$(echo "${VAR_NAME_DEF}" | sed -e 's/"name": //g' -e 's/"//g' -e 's/,//g')

VAR_NAME_VAL=$( array=( $(echo "${NODE_NAME_PROJECT}" | grep -E -o "[a-zA-Z0-9]*") ); IFS=''; echo "${array[*]}" )
VAR_NAME_LOW=$( echo "${VAR_NAME_VAL}" | tr '[:upper:]' '[:lower:]')
#VAR_NAME_FRT_UP="${VAR_NAME_LOW^}"

VAR_MODIF_NAME="\"name\": \"${VAR_NAME_LOW}\","

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
  sed -i "s/\"${VAR_NAME_DEL}\":/\"${VAR_NAME_LOW}\":/i" "${NODE_FOLDER_PROJECT}/angular.json"
  sed -i "s/\"outputPath\": \"dist\/${VAR_NAME_DEL}\"/\"outputPath\": \"dist\/${VAR_NAME_LOW}\"/i" "${NODE_FOLDER_PROJECT}/angular.json"
  sed -i "s/\"buildTarget\": \"${VAR_NAME_DEL}:build:production\"/\"buildTarget\": \"${VAR_NAME_LOW}:build:production\"/i" "${NODE_FOLDER_PROJECT}/angular.json"
  sed -i "s/\"buildTarget\": \"${VAR_NAME_DEL}:build:development\"/\"buildTarget\": \"${VAR_NAME_LOW}:build:development\"/i" "${NODE_FOLDER_PROJECT}/angular.json"
  sed -i "s/\"buildTarget\": \"${VAR_NAME_DEL}:build\"/\"buildTarget\": \"${VAR_NAME_LOW}:build\"/i" "${NODE_FOLDER_PROJECT}/angular.json"
fi

exit 0
