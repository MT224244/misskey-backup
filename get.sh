#!/bin/sh

if [ $# -ne 1 ]; then
  echo "Usage: $0 yyyyMMddHHmm"
  exit 1
fi

FILENAME="misskey_$1.sql.7z"

cd ./backups

rclone copy backup:${R2_PREFIX}/${FILENAME} .

7z e ./${FILENAME} && rm ./${FILENAME}
