from django import forms
class WikiPediaForm(forms.Form):
  """ Form class to shearch in wikipedia Index from elasticsearch"""
  text = forms.CharField(required =True)
