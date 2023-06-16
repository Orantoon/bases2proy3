#!/bin/bash
DATE=$(date '+%Y%m%d%H%M')
mkdir -p /neo4jdump/$DATE
apk update
apk upgrade
apk add neo4j-tools
az config set extension.use_dynamic_install=yes_without_prompt
neo4j-admin dump --database=graph.db --to=/neo4jdump/$DATE
az storage blob directory upload --container $CONTAINER -s /neo4jdump/$DATE -d $BACKUP_PATH --auth-mode key --recursive
rm -rf /neo4jdump/$DATE