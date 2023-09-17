while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_ANGULAR_CONTAINER bash -c "cd projectAngular && npm install"
