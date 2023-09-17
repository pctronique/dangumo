while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_ANGULAR_CONTAINER bash -c "ng new projectAngular --routing --defaults --skip-git && cp .gitignore projectAngular/"
docker exec $NAME_ANGULAR_CONTAINER bash -c "cd projectAngular/ && npm install nodemailer && npm install mongodb"
