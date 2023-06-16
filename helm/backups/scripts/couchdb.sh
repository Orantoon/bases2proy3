#!/bin/bash
DATE=$(date '+%Y%m%d%H%M')
mkdir -p /couchdbdump/$DATE
apk update
apk upgrade
apk add couchdb-tools
az config set extension.use_dynamic_install=yes_without_prompt
couchdb-dump $COUCHDB_CONNECTION_STRING > /couchdbdump/$DATE/database.sql
az storage blob directory upload --container $CONTAINER -s /couchdbdump/$DATE -d $BACKUP_PATH --auth-mode key --recursive
rm -rf /couchdbdump/$DATE