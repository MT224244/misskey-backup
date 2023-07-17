#!/bin/sh

BACKUP_FILE="/backups/${POSTGRES_DB}_$(TZ='Asia/Tokyo' date +%Y%m%d%H).sql"
COMPRESSED="${BACKUP_FILE}.7z"

pg_dump -h $POSTGRES_HOST -U $POSTGRES_USER -d $POSTGRES_DB > $BACKUP_FILE 2>> /var/log/cron.log

7z a $COMPRESSED $BACKUP_FILE

rclone copy $COMPRESSED backup:${R2_PREFIX}

if [ $? -eq 0 ]; then
  rm $BACKUP_FILE $COMPRESSED
fi
