curl -XDELETE "http://localhost:9200/demar_msq_mf"

curl -XPUT "http://localhost:9200/demar_msq_mf" -H 'Content-Type: application/json' -d'
{
  "mappings": 
  {
    "mostfields" : 
    {
      "properties": 
      {
        "title" : 
        {
          "type": "text",
          "analyzer": "english",
          "fields": 
          {
            "std" : 
            {
              "type": "text",
              "analyzer": "standard"
            }
          }
        }
      }
    }
  }
}'

curl -XPUT "http://localhost:9200/demar_msq_mf/mostfields/1" -H 'Content-Type: application/json' -d'
{ "title" : "My rabbit jumps" }'

curl -XPUT "http://localhost:9200/demar_msq_mf/mostfields/2" -H 'Content-Type: application/json' -d'
{ "title" : "Jumping jack rabbits" }'