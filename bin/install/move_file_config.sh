#!/bin/bash
FOLDER_BASE="${0%/*}/../.."
FICHIER_ENV_EXA="$FOLDER_BASE/.env.example"
FILE_CONFIG_DOCKER="$FOLDER_BASE/.docker/config"
FILE_CONFIG="$FOLDER_BASE/config"
FILE_DATA_DOCKER="$FOLDER_BASE/.docker/sgbd_data"
FILE_DATA="$FILE_CONFIG/sgbd_data"

if [ ! -e $FICHIER_ENV_EXA ]
then
    echo "Problème lors de l'installation, il manque un fichier de base pour la création des variables d'environnement."
    exit 1
fi

if [ ! -e $FILE_CONFIG_DOCKER ]
then
    echo "Il manque le dossier de configuration principale du projet docker."
    exit 1
fi

while read line  
do   
   export $line
done < $FICHIER_ENV_EXA

mkdir -p "$FILE_CONFIG"
mkdir -p "$FILE_DATA"

cp "$FILE_DATA_DOCKER/0001_people.json" "$FILE_DATA/0001_people.json"

cp "$FILE_CONFIG_DOCKER/config_email.json" "$FILE_CONFIG/config_email.json"
cp "$FILE_CONFIG_DOCKER/connection_mongo.json" "$FILE_CONFIG/connection_mongo.json"

exit 0
