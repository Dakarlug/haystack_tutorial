from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()
from haystack_tutorial.haystack_app.views import wikipedia_search

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'haystack_tutorial.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^search/', include("haystack.urls")),
    url(r'^wikipedia/', wikipedia_search)
   
)
