#!/bin/bash
DATE=$(date '+%Y%m%d%H%M')
mkdir -p /postgresqlbackup/$DATE
apk update
apk upgrade
apk add postgresql-client
az config set extension.use_dynamic_install=yes_without_prompt
pg_dump $PGDATABASE > /postgresqlbackup/$DATE/database.sql
#pg_dump --host="$POSTGRESQL_VOLUME_DIR " -U $POSTGRESQL_USERNAME -d $POSTGRESQL_DATABASE --file=/postgresqlbackup/$DATE/database.sql
gzip /postgresqlbackup/$DATE/database.sql  # Compress the database dump file
az storage blob directory upload --container $CONTAINER -s /postgresqlbackup/$DATE -d $BACKUP_PATH --auth-mode key --recursive
rm -rf /postgresqlbackup/$DATE


