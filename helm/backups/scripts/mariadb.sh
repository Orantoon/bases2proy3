#!/bin/bash
DATE=$(date '+%Y%m%d%H%M')
mkdir -p /mariadbdump/$DATE
apk update
apk upgrade
apk add  mariadb-tools
az config set extension.use_dynamic_install=yes_without_prompt
mysqldump --host="$MARIADB_CONNECTION_STRING" -u $MARIADB_USERNAME -p$MARIADB_PASSWORD --compress --result-file=/mariadbdump/$DATE
az storage blob directory upload --container $CONTAINER -s /mariadbdump/$DATE -d $BACKUP_PATH --auth-mode key --recursive
rm -rf /mariadbdump/$DATE