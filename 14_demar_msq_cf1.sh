curl -XDELETE "http://localhost:9200/demar_msq_cf1"

echo ""

curl -XPUT "http://localhost:9200/demar_msq_cf1" -H 'Content-Type: application/json' -d'
{
  "settings": 
  {
     "number_of_shards": 1,
     "number_of_replicas": 0
  },
  "mappings": 
  {
    "crossfields" : 
    {
      "properties": 
      {
        "street" : {"type": "text"},
        "city": {"type": "text"},
        "country": {"type": "text"},
        "postcode": {"type": "text"}
      }
    }
  }
}'

echo ""

curl -XPUT "http://localhost:9200/demar_msq_cf1/crossfields/1" -H 'Content-Type: application/json' -d'
{
"street": "5 Poland Street",
"city": "London",
"country": "United Kingdom",
"postcode": "W1V 3DG"
}'