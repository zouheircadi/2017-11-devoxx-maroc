curl -XDELETE "http://localhost:9200/demar_msq_cf22"

curl -XPUT "http://localhost:9200/demar_msq_cf22" -H 'Content-Type: application/json' -d'
{
  "mappings": 
  {
    "identity" : 
    {
      "properties": 
      {
        "first_name": 
        {
           "type": "text",
           "copy_to": "full_name"
          
        },
        "last_name": 
        {
          "type": "text",
           "copy_to": "full_name"
          
        },
        "full_name": 
        {
          "type": "text"
          
        }        
      }
    }
  }
}'

curl -XPUT "http://localhost:9200/demar_msq_cf22/identity/1" -H 'Content-Type: application/json' -d'
{
"first_name": "peter",
"last_name": "smith"
}'

curl -XPUT "http://localhost:9200/demar_msq_cf22/identity/2" -H 'Content-Type: application/json' -d'
{
"first_name": "peter",
"last_name": "pan"
}'