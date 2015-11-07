#!/bin/bash

TMP_DIR="/tmp/"
DATE=$(date +"%d-%m-%Y_%H%M")
BKP_FILE="$TMP_DIR/MyBkp_$DATE.tar"
BKP_DIRS="/home/user /var/www /etc"
DROPBOX_UPLOADER=/path/to/dropbox_uploader.sh

tar cf "$BKP_FILE" $BKP_DIRS
gzip "$BKP_FILE"

$DROPBOX_UPLOADER -f /root/.dropbox_uploader upload "$BKP_FILE.gz" /

rm -fr "$BKP_FILE.gz"

# Then add this line to your crontab:
# 00 00 * * *     /path/to/backup.sh 2>&1 >> /var/log/backup.log
# The script will be executed every night at midnight, and the logs will be stored in /var/log/backup.log.
