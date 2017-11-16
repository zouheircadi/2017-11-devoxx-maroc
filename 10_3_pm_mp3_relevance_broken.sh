curl -XDELETE "http://localhost:9200/pm_mp3"

curl -XPUT "http://localhost:9200/pm_mp3" -H 'Content-Type: application/json' -d'
{
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

cat > my_index_data <<- "EOF"
{ "index": { "_id": 1 }}
{ "title": "The quick brown fox" }
{ "index": { "_id": 2 }}
{ "title": "The quick brown fox jumps over the lazy dog" }
{ "index": { "_id": 3 }}
{ "title": "The quick brown fox jumps over the quick dog" }
{ "index": { "_id": 4 }}
{ "title": "Brown fox brown dog" }
EOF


curl -XPOST "http://localhost:9200/pm_mp3/my_type/_bulk" --data-binary @my_index_data; echo

