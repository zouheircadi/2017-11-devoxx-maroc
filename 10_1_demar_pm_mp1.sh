curl -XDELETE "http://localhost:9200/demar_pm_mp1"

curl -XPUT "http://localhost:9200/demar_pm_mp1" -H 'Content-Type: application/json' -d'
{
  "settings": 
  {
    "index" :
    {
      "similarity" : 
      {
        "default" : 
        {
          "type" : "classic"
        }
      }
    }
  }, 
   "mappings" :
   {
      "my_type" : 
      {
          "properties": 
          {
              "title": 
              {
                  "type": "text"
              }
          }   
      }
   }
}'


curl -XPOST "http://localhost:9200/demar_pm_mp1/my_type/_bulk" -H 'Content-Type: application/json' -d'
{ "index": { "_id": 1 }}
{ "title": "The quick brown fox" }
{ "index": { "_id": 2 }}
{ "title": "The quick brown fox jumps over the lazy dog" }
{ "index": { "_id": 3 }}
{ "title": "The quick brown fox jumps over the quick dog" }
{ "index": { "_id": 4 }}
{ "title": "Brown fox brown dog" }
'


curl -XGET "http://localhost:9200/demar_pm_mp1/my_type/_search?explain" -H 'Content-Type: application/json' -d'
{
  "query": 
  {
    "match": {
      "title": "QUICK!"
    }
  }
}'