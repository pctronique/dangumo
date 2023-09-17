mkdir -p projecttmp
mkdir -p projecttmp/logs
mkdir -p projecttmp/logs/angular
mkdir -p projecttmp/logs/pm2
mkdir -p projecttmp/mongo_data

touch projecttmp/logs/angular/ng_out.log
touch projecttmp/logs/angular/ng_error.log

 # creation du fichier .gitignore
if [ -e project/.gitignore ]
then
    echo ""
else
    echo ""
    cp .docker/config/gitignore_angular project/.gitignore
fi

chmod 777 -R project
chmod 777 -R projecttmp

# creation du fichier .env
if [ -e .env ]
then
    echo ""
else
    echo ""
    cp .env.example .env
fi

docker-compose up -d

./bin/import_sgbd.sh

./bin/createProject.sh
#./bin/updateProject.sh
./bin/start.sh
