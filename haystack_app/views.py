from django.shortcuts import render

# Create your views here.
from django.contrib.auth.decorators import login_required
from haystack_tutorial.haystack_app.forms import WikiPediaForm
from haystack_tutorial.haystack_app.search_indexes import WikiPediaIndex

@login_required
def wikipedia_search(request):
   wiki_form, json, out, data = WikiPediaForm(),{}, [] ,[]
   if request.GET:
      wiki_form = WikiPediaForm(request.GET)
      if  wiki_form.is_valid():
         json = WikiPediaIndex.search_basic(wiki_form.cleaned_data.get("text"))
         try:
            data =json['hits']['hits']
            if not len(data):
               raise Exception("Fail")
            for resource in data:
              if resource.has_key("_source"):
                  item = resource.get("_source")
                  out.append([item.get("title"), 
		    item.get("text")[:100] if len(item.get("text"))>100
		    else item.get("text")
		  ])
         except  :
	    data =[]
         else :
            # limit query to 10
            data =out[:10]
         #print 'data', data[0][0] ,  "text" ,  data[0][1][:100]
         #print '='*50
         #print 'data', data[1][0] ,  "text" ,  data[1][1][:100]
         #print '='*50
         #print 'data', data[-1][0] , "text" ,  data[-1][1][:100]
         #print "text", wiki_form.cleaned_data.get("text")
   return render(request, "haystack_app/wikipedia_search.html", {
    'json': data,
    "form": wiki_form
  })


