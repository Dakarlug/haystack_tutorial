from django.db import models

# Create your models here.

"""
Here we will define our SFDEvent Model with some basics
attributes:author title, description of event , and 
pup_date date of publication
"""
from django.db import models

class SFDEvent(models.Model):
  title = models.CharField(max_length =50)
  author = models.CharField(max_length =50)
  pub_date = models.DateTimeField(auto_now_add =True)
  description = models.TextField()

  
  def __unicode__(self):
     return u"<SFDevent :  title : %s >" % self.title 
