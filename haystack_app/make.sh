#! /bin/sh

sudo apt-get update

# This script install elasticsearch by using the  dkpg installer 
# so if  for any reason you need to delete this elasticsearch 
# so run just 

# sudo dpkg -r elasticsearch


# if your keyboard is qwerty, you can change it by typing 
# setxkbmap fr , Note that this is not related to what we 
# are doing now  :)


# start
# get the link of the latest version of the elasticsearch package 
# from the official web site of the elasticsearch project 
# www.elasticsearch.org/download

# elastic search is based on apache lucene, so need java to run 


# run  chmod u+rwx installdebian.sh  to allow yourself

sudo apt-get install openjdk-6-jdk
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.deb

# install the package
sudo dpkg -i elasticsearch-0.90.7.deb
sudo rm  elasticsearch-0.90.7.deb

 
# go to url http://127.0.0.1:9200/ , you should get something like that 
#
#{
#  "ok" : true,
#  "status" : 200,
#  "name" : "Fan Boy",
#  "version" : {
#    "number" : "0.90.7",
#    "build_hash" : "36897d07dadcb70886db7f149e645ed3d44eb5f2",
#    "build_timestamp" : "2013-11-13T12:06:54Z",
#    "build_snapshot" : false,
#    "lucene_version" : "4.5.1"
#  },
#  "tagline" : "You Know, for Search"
#}


# We have an already postgres cluster running , and we need to create 
# a river between elasticsearch and postgres .
# The elasticsearch jdbc river is developing on github you can see it
# on http://github.com/elasticsearch


# installing the jdbc-river from git here is where to find more information
# https://github.com/jprante/elasticsearch-river-jdbc/wiki/Quickstart


#intalling jdbc river , for me my elasticsearch home is
#/usr/share/elasticsearch
#{YOUR_ES_HOME}/bin/plugin -install river-jdbc -url http://bit.ly/1iovWV9

# http://bit.ly/1iovWV9 is where you can find the latest version of JDBC 
# for postgres.

sudo /usr/share/elasticsearch/bin/plugin \
		-install river-jdbc \
	        -url http://bit.ly/1iovWV9


# Install Driver JDBC
wget http://jdbc.postgresql.org/download/postgresql-9.3-1100.jdbc3.jar
sudo cp  postgresql-9.3-1100.jdbc3.jar  /usr/share/elasticsearch/lib
sudo rm postgresql-9.3-1100.jdbc3.jar



echo Installing  the wikipedia river
#wget https://github.com/elasticsearch/elasticsearch-river-wikipedia/archive/v1.3.0.zip
#unzip v1.3.0.zip v1.3.0
#sudo /usr/share/elasticsearch/bin/plugin -install 

cd  /usr/share/elasticsearch/
sudo bin/plugin -install elasticsearch/elasticsearch-river-wikipedia/1.3.0



# check if the river is correcty installed 
# configure your log4j 

#sudo java -cp /etc/elasticsearch/logging.yml

# run elasticsearch 
sudo /etc/init.d/elasticsearch restart

# check if the river is correctly installed 
#/usr/share/elasticsearch/bin/elasticsearch -f

echo checking rivers

/usr/share/elasticsearch/bin/elasticsearch \
	-Des.config=/etc/elasticsearch/elasticsearch.yml -f

sleep 20
# and you got

#36897d0/2013-11-13T12:06:54Z]
#[2013-12-18 14:36:13,075][INFO ][node                     ] [Century, Turner] initializing ...
#[2013-12-18 14:36:13,117][INFO ][plugins                  ] [Century, Turner] loaded [jdbc-river], sites []

echo Installing django-haystack
sudo apt-get install python-pip
sudo pip install django==1.6
sudo pip install django-haystack==2.0.0





