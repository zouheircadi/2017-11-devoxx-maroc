curl -XDELETE "http://localhost:9200/demar_sqs_bf"


curl -XPUT "http://localhost:9200/demar_sqs_bf" -H 'Content-Type: application/json' -d'
{
  "settings" :
  {
    "number_of_shards" : 1,
    "number_of_replicas" : 0
  },
  "mappings" : 
  {
    "bestfields" : 
    {
      "properties": 
      {
        "title" : 
        {
          "type": "text"
        },
        "body" : 
        {
          "type": "text"
        }
      }
    }
  }
}'


curl -XPUT "http://localhost:9200/demar_sqs_bf/bestfields/1" -H 'Content-Type: application/json' -d'
{
  "title" : "Quick brown rabbits",
  "body" : "Brown rabbits are commonly seen."
}'


curl -XPUT "http://localhost:9200/demar_sqs_bf/bestfields/2" -H 'Content-Type: application/json' -d'
{
  "title" : "Keeping pets healthy",
  "body" : "My quick brown fox eats rabbits on a regular basis."
}'