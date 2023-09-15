while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_NODEJS_CONTAINER bash -c "cd projectAngular && ng serve --host 0.0.0.0 >> ../../projecttmp/logs/angular/ng_out.log 2>> ../../projecttmp/logs/angular/ng_error.log" &
