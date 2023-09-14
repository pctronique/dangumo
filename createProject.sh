while read line  
do   
   export $line
done < ${0%/*}/.env
docker exec $NAME_NODEJS_CONTAINER bash -c "ng new projectAngular --routing --defaults --skip-git && cp .gitignore projectAngular/"
