while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_NODEJS_CONTAINER bash -c "cd projectAngular && npm install"
