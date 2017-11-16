curl -XDELETE "http://localhost:9200/demar_mqs"

curl -XPUT "http://localhost:9200/demar_mqs" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 0
  },
  "mappings": {
    "books": {
      "properties": {
        "title": {
          "type": "text"
        },
        "author": {
          "type": "text"
        },
        "translator": {
          "type": "text"
        }
      }
    }
  }
}'

curl -XPUT "http://localhost:9200/demar_mqs/books/1" -H 'Content-Type: application/json' -d'
{
   "title": "War and Peace",
   "author": "Leo Tolstoy",
   "translator": "Constance Garnett"
}'

curl -XPUT "http://localhost:9200/demar_mqs/books/2" -H 'Content-Type: application/json' -d'
{
   "title": "War and Peace",
   "author": "Leo Tolstoy",
   "translator": "Louise Maude"
}'

curl -XPUT "http://localhost:9200/demar_mqs/books/3" -H 'Content-Type: application/json' -d'
{
   "title": "War and Peace",
   "author": "Leo Tolstoy",
   "translator": "Vladimir Ilitch Oulianov"
}'

curl -XPUT "http://localhost:9200/demar_mqs/books/4" -H 'Content-Type: application/json' -d'
{
   "title": "Le vieil homme et la mer",
   "author": "Ernest Hemingway",
   "translator": "John the translator"
}'