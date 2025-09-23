#!/bin/sh
set -ex

POSTGRE_USER="user"
POSTGRE_PASS="pass"
DB="XXXX"
FOLDER="/backups/`date +%Y-%m-%d`"
FILE="$FOLDER/$DB.sql"
LOG_FILE="$FOLDER/log.txt"

echo "mkdir $FOLDER&& touch $LOG_FILE&& exec > $LOG_FILE 2>&1;  echo $POSTGRE_PASS | pg_dump -d $DB -U $POSTGRE_USER -W -v --file $FILE > $LOG_FILE " | docker exec -i XXXX-postgre-master sh
