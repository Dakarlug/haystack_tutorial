#! /bin/sh
apt-get install curl

#curl -XDELETE localhost:9200/_river/my_river/


#crating the wikipedia index
#curl -XPUT localhost:9200/_river/my_river/_meta -d '{
# "type": "wikipedia"
#}
#'


# test our index with basic search
#curl -XGET 'http://localhost:9200/_search' -d '{
# "query": {
#   "match" : {"text": "senegal dakar country"}
#}
#}
#'




# test our index with basic search
curl -XGET 'http://localhost:9200/_search' -d '{
 "query": {
   "match" : {
      "text": {
	"query": "senegal dakar country macky sall", 
	"operator": "and"
      }
   }
 }
}
'

