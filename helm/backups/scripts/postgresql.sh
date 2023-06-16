#!/bin/bash
DATE=$(date '+%Y%m%d%H%M')
mkdir -p /postgresqldump/$DATE
apk update
apk upgrade
apk add postgresql-client
az config set extension.use_dynamic_install=yes_without_prompt
pg_dump $PGDATABASE > /postgresqldump/$DATE/database.sql
gzip /postgresqldump/$DATE/database.sql  # Compress the database dump file
az storage blob directory upload --container $CONTAINER -s /postgresqldump/$DATE -d $BACKUP_PATH --auth-mode key --recursive
rm -rf /postgresqldump/$DATE


