while read line  
do   
   export $line
done < ${0%/*}/.env
cd /home/project/$FOLDER_PROJECT_ANGULAR
ng serve --host 0.0.0.0 >> ../../projecttmp/logs/angular/ng_out.log 2>> ../../projecttmp/logs/angular/ng_error.log
