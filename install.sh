./bin/install/start_install.sh

#./bin/install/message.sh

if [ ! -e .env ]
then
    exit 1
fi

mkdir -p projecttmp
mkdir -p projecttmp/logs
mkdir -p projecttmp/logs/angular
mkdir -p projecttmp/mongo_data

touch projecttmp/logs/angular/ng_out.log
touch projecttmp/logs/angular/ng_error.log

chmod 777 -R project
chmod 777 -R projecttmp

# creation du docker du projet
if docker-compose up --build -d ; then
    ./bin/import_sgbd.sh

    ./bin/createProject.sh
    #./bin/updateProject.sh
    ./start.sh

    ./bin/install/end_install.sh
fi
