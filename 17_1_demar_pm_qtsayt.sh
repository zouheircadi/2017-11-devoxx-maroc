curl -XDELETE "http://localhost:9200/demar_pm_qtsayt"

curl -XPUT "http://localhost:9200/demar_pm_qtsayt" -H 'Content-Type: application/json' -d'
{
  "settings": 
  {
    "number_of_shards": 1,
    "number_of_replicas": 0
  },
  "mappings": 
  {
    "my_type" : 
    {
      "properties": 
      {
        "name" : 
        {
          "type": "string"
        }
      }
    }
  }
}'

curl -XPOST "http://localhost:9200/demar_pm_qtsayt/my_type/_bulk" -H 'Content-Type: application/json' -d'
{ "index": { "_id": 1 }}
{ "name": "Brown foxes" }
{ "index": { "_id": 2 }}
{ "name": "Yellow furballs" }
{ "index": { "_id": 3 }}
{ "name": "Orange green furballs" }
'

curl -XPOST "http://localhost:9200/demar_pm_qtsayt/_refresh"