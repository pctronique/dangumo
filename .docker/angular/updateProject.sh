while read line  
do   
   export $line
done < ${0%/*}/.env
cd /home/project/$FOLDER_PROJECT
ng serve --host 0.0.0.0 >> /var/log/angular/ng_out.log 2>> /var/log/angular/ng_error.log
