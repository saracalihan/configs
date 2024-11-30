#!/bin/sh
set -ex

MONGO_USER="user"
MONGO_PASS="pass"
FOLDER="/backups/`date +%Y-%m-%d`"
LOG_FILE="$FOLDER/log.txt"

echo "mkdir $FOLDER&& touch $LOG_FILE&& exec > $LOG_FILE 2>&1; mongodump -u $MONGO_USER -p $MONGO_PASS -o $FOLDER > $LOG_FILE " | docker exec -i XXXX-mongo-master sh
