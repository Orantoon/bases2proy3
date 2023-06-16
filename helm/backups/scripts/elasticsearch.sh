#!/bin/bash
DATE=$(date '+%Y%m%d%H%M')
mkdir -p /elasticsearchdump/$DATE
apk update
apk upgrade
apk add  elasticsearch-tools
az config set extension.use_dynamic_install=yes_without_prompt
elasticdump --input="$ELASTICSEARCH_CONNECTION_STRING" --username $ELASTICSEARCH_USERNAME --password $ELASTICSEARCH_PASSWORD --output=/elasticsearchdump/$DATE
az storage blob directory upload --container $CONTAINER -s /elasticsearchdump/$DATE -d $BACKUP_PATH --auth-mode key --recursive
rm -rf /elasticsearchdump/$DATE