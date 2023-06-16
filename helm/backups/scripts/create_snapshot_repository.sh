#!/bin/bash

curl -XPUT 'http://localhost:9200/_snapshot/my_backup_repo' -H 'Content-Type: application/json' -d '
{
  "type": "fs",
  "settings": {
    "location": "/path/to/repository"
  }
}
'
#reemplazar http://localhost:9200 con la URL correcta de tu clúster de Elasticsearch y /path/to/repository con la ubicación deseada para almacenar los snapshots.