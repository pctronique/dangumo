#!/bin/bash
if ! ${0%/*}/message_create_container.sh ; then
  exit 1
fi

while read line  
do   
  if [ ! -z "$line" ]
  then
      export $line
  fi
done < ${0%/*}/../../.env

cp ${0%/*}/../../.docker/config/gitignore_angular ${0%/*}/../../project/www/.gitignore

#LINE1="- .\/.docker\/config\/.env.local.example:\/home\/project\/www\/.env.local:ro"
#LINE1_REPLACE="- .\/.docker\/config\/.env.local.example:\/home\/project\/$FOLDER_PROJECT_SYMFONY\/.env.local:ro"
#DESACTIVE="#"
#FILE="${0%/*}/../../docker-compose.yml"
#sed -i "s/$DESACTIVE$LINE1/$LINE1_REPLACE/" $FILE

FOLDER_PROJECT_PROJECT_1="$(tr '[:lower:]' '[:upper:]' <<< ${FOLDER_PROJECT:0:1})${FOLDER_PROJECT:1}"
NAME_PROJECT_1="$(tr '[:lower:]' '[:upper:]' <<< ${NAME_PROJECT:0:1})${NAME_PROJECT:1}"

INDEX_LINE1="<title>$FOLDER_PROJECT_PROJECT_1<\/title>"
INDEX_LINE1_REPLACE="<title>$NAME_PROJECT_1<\/title>"
INDEX_FILE="${0%/*}/../../project/$FOLDER_PROJECT/src/index.html"
sed -i "s/$INDEX_LINE1/$INDEX_LINE1_REPLACE/" $INDEX_FILE

README_LINE1="# $FOLDER_PROJECT_PROJECT_1"
README_LINE1_REPLACE="# $NAME_PROJECT_1"
README_FILE="${0%/*}/../../project/$FOLDER_PROJECT/README.md"
sed -i "s/$README_LINE1/$README_LINE1_REPLACE/" $README_FILE

APP_TS_LINE1="title = '$FOLDER_PROJECT';"
APP_TS_LINE1_REPLACE="title = '$NAME_PROJECT';"
APP_TS_FILE="${0%/*}/../../project/$FOLDER_PROJECT/src/app/app.component.ts"
sed -i "s/$APP_TS_LINE1/$APP_TS_LINE1_REPLACE/" $APP_TS_FILE

APP_SPEC_LINE1="$FOLDER_PROJECT"
APP_SPEC_LINE1_REPLACE="$NAME_PROJECT"
APP_SPEC_FILE="${0%/*}/../../project/$FOLDER_PROJECT/src/app/app.component.spec.ts"
sed -i "s/$APP_SPEC_LINE1/$APP_SPEC_LINE1_REPLACE/" $APP_SPEC_FILE

ANGU_JSON_LINE1="$FOLDER_PROJECT"
ANGU_JSON_LINE1_REPLACE="$NAME_PROJECT"
ANGU_JSON_FILE="${0%/*}/../../project/$FOLDER_PROJECT/angular.json"
sed -i "s/$ANGU_JSON_LINE1/$ANGU_JSON_LINE1_REPLACE/" $ANGU_JSON_FILE

PACK_JSON_LINE1="$FOLDER_PROJECT"
PACK_JSON_LINE1_REPLACE="$NAME_PROJECT"
PACK_JSON_FILE="${0%/*}/../../project/$FOLDER_PROJECT/package.json"
sed -i "s/$PACK_JSON_LINE1/$PACK_JSON_LINE1_REPLACE/" $PACK_JSON_FILE

cd ${0%/*}/../../
if ! docker compose up -d ; then
  exit 1
fi

exit 0
