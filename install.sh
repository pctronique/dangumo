mkdir -p projecttmp
mkdir -p projecttmp/logs
mkdir -p projecttmp/mongo_data

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

#./bin/ng.sh analytics --global
#./bin/ng.sh analytics on
#./bin/ng.sh new projectAngular --routing --defaults --global
#./bin/ng.sh projectAngular/serve --host 0.0.0.0  >> ../../log/ng_out.log 2>> ../../log/ng_error.log
