curl -XDELETE "http://localhost:9200/demar_filter_2"


curl -XPUT "http://localhost:9200/demar_filter_2" -H 'Content-Type: application/json' -d'
{
  "mappings": 
  {
    "products" : 
    {
       "properties": 
       {
         "price" : {"type": "double"},
         "productID" : {"type": "keyword"}
       }   
    }
  }
}'


curl -XPOST "http://localhost:9200/demar_filter_2/products/_bulk" -H 'Content-Type: application/json' -d'
{ "index": { "_id": 1 }}
{ "price" : 10, "productID" : "XHDK-A-1293-#fJ3" }
{ "index": { "_id": 2 }}
{ "price" : 20, "productID" : "KDKE-B-9947-#kL5" }
{ "index": { "_id": 3 }}
{ "price" : 30, "productID" : "JODL-X-1937-#pV7" }
{ "index": { "_id": 4 }}
{ "price" : 30, "productID" : "QQPX-R-3956-#aD8" }
'


curl -XGET "http://localhost:9200/demar_filter_2"

curl -XGET "http://localhost:9200/demar_filter_2/_search" -H 'Content-Type: application/json' -d'
{
  "query": 
  {
      "bool": 
      {
        "filter": 
        [
           {"term" : {"productID" : "XHDK-A-1293-#fJ3"}}
        ]
      }
  }
}'


curl -XGET "http://localhost:9200/demar_filter_2/_analyze" -H 'Content-Type: application/json' -d'
{
  "field" : "productID",  
  "text" : "XHDK-A-1293-#fJ3"
}'

# The keyword tokenizer emits the original 
# input string as a #single unchanged token.


curl -XGET "http://localhost:9200/demar_filter_1/_search" -H 'Content-Type: application/json' -d'
{
  "query": 
  {
      "bool": 
      {
        "must": 
        [
          {"match_all": {}}
        ],
        "filter": 
        [
           {"term" : {"productID" : "XHDK-A-1293-#fJ3"}}
        ]
      }
  }
}'