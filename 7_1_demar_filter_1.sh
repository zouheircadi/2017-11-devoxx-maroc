curl -XDELETE "http://localhost:9200/demar_filter_1"

#POST /{index}/{type}/_bulk
# {
# { "index": { "_id": <id> }}
# { "FIELD1" : value1, "field2" : "value2" }
# index, create, update, delete
# }

curl -XPOST "http://localhost:9200/demar_filter_1/products/_bulk" -H 'Content-Type: application/json' -d'
{ "index": { "_id": 1 }}
{ "price" : 10.0, "productID" : "XHDK-A-1293-#fJ3" }
{ "index": { "_id": 2 }}
{ "price" : 20, "productID" : "KDKE-B-9947-#kL5" }
{ "index": { "_id": 3 }}
{ "price" : 30, "productID" : "JODL-X-1937-#pV7" }
{ "index": { "_id": 4 }}
{ "price" : 30, "productID" : "QQPX-R-3956-#aD8" }
'



curl -XGET "http://localhost:9200/demar_filter_1/_search" -H 'Content-Type: application/json' -d'
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



curl -XGET "http://localhost:9200/demar_filter_1/_analyze" -H 'Content-Type: application/json' -d'
{
  "field" : "productID",  
  "text" : "XHDK-A-1293-#fJ3"
}'


curl -XGET "http://localhost:9200/demar_filter_1"