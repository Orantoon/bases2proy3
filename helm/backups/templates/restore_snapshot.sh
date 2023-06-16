#!/bin/bash

curl -XPOST 'http://localhost:9200/_snapshot/my_backup_repo/my_snapshot_20230615/_restore' -H 'Content-Type: application/json' -d '
{
  "indices": "index1,index2",
  "ignore_unavailable": true,
  "include_global_state": false
}
'
#ajustar la URL de Elasticsearch y los nombres de los índices
#reemplazar http://localhost:9200 con la URL correcta de tu clúster de Elasticsearch 