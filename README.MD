
In this tutorial , we are going together to andertand how 
elasticsheard work . And we will firt implement a basic app in 
django with the Python Haystack librairy to demostrate how to use 
Elasticshearh in production context . And to test performance we 
will index The wikipedia and shearch on it index .


This Tutorial is motived ater watching This Video 
http://www.youtube.com/watch?v=lpZ6ZajygDY where shay Banon, the fonder 
of elasticSearch explain why he create it .
So To resume things. ElasticSearch is only for Indexing and Searching Data.

One interresting thing of this video try to explain is The difference 
between shard and Node . for be this link help me to andertand the
differecence.

http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/index-modules-allocation.html


So For Banon. increasing node indeinitly does not really Help Performance
search by you need to manage performance search. please This is an 
important point for tunning elasticsearch. So If I misanderstand
something . do not hesite to correcte me /

Look at this following elasticsearch configuration . with the
first you get hight avaibility of data . but you you dont gain
performance shearch . In the second . sharing between Node are
perfect and you get more performance search.

Flow oNe
=======



Flow Two
=======







Installation
===========
You can install django with postgres and elasticsearch by doing 

    ./make

For the reste you can check The Haystack documentation before
reading this python class

Form shearch
============
Same as the django form. you create your search form here 

    SFDSearchForm


Model Index
============
Same as the django Model . Here you will define you document
stucture. Elasticshearh will use it when it create schema of 
the document



    >>python manage.py updateindex -v2
    >>Indexing 1 sfd events
    >>indexed 1 - 1 of 1 (by 4083).


Wikipedia-Index
===============
To test performance search we will index wikipedia is dataBase



Run 
===

    ./manage.py syncdb
    ./manage.py runserver

 
Go To http//localhost




















 

