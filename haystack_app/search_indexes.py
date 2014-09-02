"""
This is the search Index Model class , Here will will 
define our shearch index Model .I use The haystacksearch.org/
to create The Index class. For wikipedia , we will use A 
simple Python requests class to hits data from elasticsearch
end point, and a JSON load , method to load data . We
are inspired by This exellent wiki on elasticsearch query 
DSL  
http://okfnlabs.org/blog/2013/07/01/elasticsearch-query-tutorial.html
"""

import json, urllib2
import datetime
from haystack import indexes
from haystack_tutorial.haystack_app.models import SFDEvent

class SFDEventIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.CharField(document=True, use_template=True)
    title = indexes.CharField(model_attr='title')
    pub_date = indexes.DateTimeField(model_attr='pub_date')
    description = indexes.CharField(model_attr='description')
   
    def get_model(self):
        return SFDEvent	

    def index_queryset(self, using=None):
        """Used when the entire index for model is updated."""
        return self.get_model().objects.filter(pub_date__lte=datetime.datetime.now())


class WikiPediaIndex(object):
  """
  This is a index ispired by Haystack Index class 
  """ 
  @classmethod
  def search_basic(cls, query):
     url   = 'http://localhost:9200/_search'
     data  = { 
     "query": {
         "match" : {
           "text": {
	    "query" :  str(query) ,
	    "operator": "and"
           }
           , "size": 1
         }
      }
     }
     # have to send the data as JSON
     data = json.dumps(data)
     print data
     req = urllib2.Request(url, data)
     out = urllib2.urlopen(req)
     data =json.load(out)
     json.dump(data, open("out.json", "wb"))
     print data['hits']['total']
     return data
   

if __name__ == "__main__":
   WikiPediaIndex.search_basic(query = "dakar senegal")



