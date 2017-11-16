curl -XDELETE "http://localhost:9200/demar_6_mqs"
curl -XDELETE "http://localhost:9200/_template/template_devoxx_ma"


curl -XPUT "http://localhost:9200/_template/template_devoxx_ma" -H 'Content-Type: application/json' -d'
{
  "template": "demar_*",
  "settings": 
  {
    "number_of_shards": 1,
    "number_of_replicas": 0
  }
}'



curl -XPUT "http://localhost:9200/demar_6_mqs" -H 'Content-Type: application/json' -d'
{
  "mappings" : 
  {
    "books" : 
    {
      "properties" : 
      {
        "title" : {"type": "text"}
      }
    }
  }
}'