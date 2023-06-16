#!/bin/bash

curl -XPUT 'http://localhost:9200/_snapshot/my_backup_repo/my_snapshot_20230615' -H 'Content-Type: application/json' -d '
{
  "indices": "index1,index2",
  "ignore_unavailable": true,
  "include_global_state": false
}
'
#ajustar la URL de Elasticsearch y los nombres de los índice
#reemplazar http://localhost:9200 con la URL correcta de tu clúster de Elasticsearch 