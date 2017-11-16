curl -XDELETE "http://localhost:9200/demar_4_mqs"

curl -XPUT "http://localhost:9200/demar_4_mqs/books/1" -H 'Content-Type: application/json' -d'
{
  "title" : "War and Peace",
  "author" : "Leo Tolstoï",
  "translator" : "Constance Garnet"
}'