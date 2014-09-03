ElasticSearch - HayStack
========================


In this tutorial , we are going together to learn  how 
elasticsearch  work . We will first implement a basic app in 
django with the Python Haystack librairy to demostrate how to use 
Elasticshearh in production context . And to test performance we 
will index The wikipedia and shearch throught it database .


This Tutorial is motived ater watching This Video 
http://www.youtube.com/watch?v=lpZ6ZajygDY where shay Banon, the creator 
of elasticSearch explain why he create it .
So To resume things. ElasticSearch is only for Indexing and Searching Data.

One interesting thing  this video try to explain is : The diference 
between shard and Node. This link help me to anderstand the
diferecence.

http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/index-modules-allocation.html


So For Banon. increasing node indenitly does not really Help Performance
search but you need to manage performance search with sharding . 
please This is an important point for tunning elasticsearch. 
So If I mis-understand something. do not hesite to correcte me /

Look at this following elasticsearch configuration . with the
two you get hight avaibility of data . but  you don' t gain
performance shearch . How ever in the first . sharding between Node are
perfect and you get more performance search.

Flow oNe
=======

![Texte alternatif](https://raw.githubusercontent.com/Dakarlug/haystack_tutorial/master/docs/images.jpeg "texte pour le titre, facultatif")

Flow Two
=======

![Texte alternatif](https://raw.githubusercontent.com/Dakarlug/haystack_tutorial/master/docs/images2.jpeg "texte pour le titre, facultatif")






Installation
===========
You can install django with postgres and elasticsearch and all 
plugin we need as wikipedia  with /make.sh script . Check The 
wikipedia Plugin documentation Here https://github.com/elasticsearch/elasticsearch-river-wikipedia.

    ./make

For the reste you can check The Haystack documentation before
reading this python class
  
     haystack_app.search_indexes.py

   



Model Index
============

Same as the django Model . Here you will define your document
stucture. Elasticshearh will use it when it create schema of 
the document . And You reIndex you data with The django manager
command . Note That You will need to do this in a ./cron .So
The process will be done regulary.



    >>python manage.py updateindex -v2
    >>Indexing 1 sfd events
    >>indexed 1 - 1 of 1 (by 4083).


Wikipedia-Index
===============

To test performance search we will index wikipedia dataBase
.Look at theses following classes .

     haystack_app.search_indexes.py
     
     haystack_app.forms.py
     
     haystack_app.views.py



Screenshot
==============

![Texte alternatif](https://raw.githubusercontent.com/Dakarlug/haystack_tutorial/master/docs/screenshot_1.png "texte pour le titre, facultatif")


![Texte alternatif](https://raw.githubusercontent.com/Dakarlug/haystack_tutorial/master/docs/screenshot_2.png "texte pour le titre, facultatif")



Run 
===

    ./manage.py syncdb
    ./manage.py updateindex -v2
    ./manage.py runserver

    Django version 1.6, using settings 'haystack_tutorial.settings'
    Starting development server at http://127.0.0.1:8000/
    Quit the server with CONTROL-C.


Go To http://127.0.0.1:8000/




















 

