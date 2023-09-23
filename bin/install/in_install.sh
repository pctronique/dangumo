#!/bin/bash

while read line  
do   
   export $line
done < ${0%/*}/../../.env

cp ${0%/*}/../../.docker/config/.gitignore ${0%/*}/../../project/www/.gitignore

LINE1="- .\/.docker\/config\/.env.local.example:\/home\/project\/www\/.env.local:ro"
LINE1_REPLACE="- .\/.docker\/config\/.env.local.example:\/home\/project\/$FOLDER_PROJECT_SYMFONY\/.env.local:ro"
DESACTIVE="#"
FILE="${0%/*}/../../docker-compose.yml"
sed -i "s/$DESACTIVE$LINE1/$LINE1_REPLACE/" $FILE

INDEX_LINE1="<title>$FOLDER_PROJECT_ANGULAR</title>"
INDEX_LINE1_REPLACE="<title>$NAME_PROJECT</title>"
INDEX_FILE="${0%/*}/../../project/$FOLDER_PROJECT_ANGULAR/src/index.html"
sed -i "s/$INDEX_LINE1/$INDEX_LINE1_REPLACE/" $INDEX_FILE

README_LINE1="# $FOLDER_PROJECT_ANGULAR"
README_LINE1_REPLACE="# $NAME_PROJECT"
README_FILE="${0%/*}/../../project/$FOLDER_PROJECT_ANGULAR/README.md"
sed -i "s/$README_LINE1/$README_LINE1_REPLACE/" $README_FILE

cd ${0%/*}/../../
docker-compose up -d
