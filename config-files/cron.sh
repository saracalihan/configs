chmod -x backup-mongo.sh

# saat 00.00'da backup al
crontab -l | { cat; echo "0 0 * * * /root/sites/XXXX/scripts/backup-mongo.sh"; } | crontab -
