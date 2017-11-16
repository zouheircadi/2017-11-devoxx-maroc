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

curl -XPOST "http://localhost:9200/_refresh"

curl -XGET "http://localhost:9200/demar_pm_qtsayt/my_type/_search" -H 'Content-Type: application/json' -d'
{
  "query": 
  {
      "match_phrase_prefix": 
      {
        "name": 
        {
          "query": "green Orange  furbal",
          "slop" : 50,
          "max_expansions" : 50
        }
      }
 
  }
}'


curl -XGET "http://localhost:9200/demar_pm_qtsayt/my_type/_validate/query?explain" -H 'Content-Type: application/json' -d'
{
  "query": 
  {
      "match_phrase_prefix": 
      {
        "name": 
        {
          "query": "green Orange furbal",
          "slop" : 50,
          "max_expansions" : 50
        }
      }
 
  }
}'

#Preparing the Index

curl -XDELETE "http://localhost:9200/demar_pm_itsayt"


curl -XPUT "http://localhost:9200/demar_pm_itsayt" -H 'Content-Type: application/json' -d'
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
          "type": "string",
          "analyzer": "autocomplete_analyzer"
        }
      }
    }
    
  }  
}'


curl -XPOST "http://localhost:9200/demar_pm_itsayt/my_type/_bulk" -H 'Content-Type: application/json' -d'
{ "index": { "_id": 1 }}
{ "name": "Brown foxes" }
{ "index": { "_id": 2 }}
{ "name": "Yellow furballs" }
'


#Querying the field
curl -XGET "http://localhost:9200/demar_pm_itsayt/my_type/_search" -H 'Content-Type: application/json' -d'
{
  "query": 
  {
    "match": {
      "name": "brown fo"
    }
  }
}'

curl -XGET "http://localhost:9200/demar_pm_itsayt/my_type/_validate/query?explain" -H 'Content-Type: application/json' -d'
{
  "query": 
  {
    "match": {
      "name": "brown f"
    }
  }
}'


curl -XGET "http://localhost:9200/demar_pm_itsayt/my_type/_validate/query?explain" -H 'Content-Type: application/json' -d'
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


curl -XPOST "http://localhost:9200/demar_pm_itsayt/my_type/_mapping" -H 'Content-Type: application/json' -d'
{
  "my_type" : 
  {
    "properties" : 
    {
       "name" : 
       {
         "type" : "string",
         "index_analyzer"  : "autocomplete_analyzer",
         "search analyzer"  : "standard"
       }
    }
  }
}'


curl -XPOST "http://localhost:9200/demar_pm_itsayt/my_type/_validate/query?explain" -H 'Content-Type: application/json' -d'
{
  "query" : {
    "match_phrase": {
      "name": {
        "query": "brown fo",
        "analyzer": "standard"
      }
    }
  }
}'