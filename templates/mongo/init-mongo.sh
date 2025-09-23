#!/bin/sh
set -ex

MONGO_USER="user"
MONGO_PASS="pass"

# create user
docker exec -it XXXX-mongo-master mongosh -u $MONGO_USER -p $MONGO_PASS --eval "db = db.getSiblingDB(\"XXXX\"); db.createUser({ user: \"${MONGO_USER}\", pwd: \"${MONGO_PASS}\", roles: [\"dbOwner\"] });"

# restore dumps
docker exec -it XXXX-mongo-master mongorestore --username=$MONGO_USER --password=$MONGO_PASS --dir=/dump
