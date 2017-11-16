curl -XDELETE "http://localhost:9200/demar_pm_itsayt2"


curl -XPUT "http://localhost:9200/demar_pm_itsayt2" -H 'Content-Type: application/json' -d'
{
  "settings": 
  {
    "number_of_shards": 1,
    "number_of_replicas": 0
    , "analysis": 
    {
      "filter": 
      {
        "autocomplete_filter" : 
        {
          "type" : "edge_ngram",
          "min_gram" : 1,
          "max_gram" : 20
        }
      },
      "analyzer": 
      {
        "autocomplete_analyzer" : 
        {
          "type" : "custom",
          "tokenizer" : "standard",
          "filter" : ["lowercase","autocomplete_filter"]
        }
      }
    }
  },
  "mappings": 
  {
    "my_type" : 
    {
      "properties": 
      {
        "name" :
        {
          "type": "text",
          "analyzer": "autocomplete_analyzer"
        }
      }
    }
    
  }  
}'


curl -XPOST "http://localhost:9200/demar_pm_itsayt2/my_type/_bulk" -H 'Content-Type: application/json' -d'
{ "index": { "_id": 1 }}
{ "name": "Brown foxes" }
{ "index": { "_id": 2 }}
{ "name": "Yellow furballs" }
'


#Querying the field
curl -XGET "http://localhost:9200/demar_pm_itsayt2/my_type/_search" -H 'Content-Type: application/json' -d'
{
  "query": 
  {
    "match": {
      "name": "brown fo"
    }
  }
}'

curl -XGET "http://localhost:9200/demar_pm_itsayt2/my_type/_validate/query?explain" -H 'Content-Type: application/json' -d'
{
  "query": 
  {
    "match": {
      "name": "brown f"
    }
  }
}'


curl -XGET "http://localhost:9200/demar_pm_itsayt2/my_type/_validate/query?explain" -H 'Content-Type: application/json' -d'
{
  "query": 
  {
    "match": {
      "name": {
        "query": "brown fo",
        "analyzer" : "standard"
      }
    }
  }
}'