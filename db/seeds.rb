# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# 
# RSS sources
#
Source.create!(:name => "BBC News", :url => "http://feeds.bbci.co.uk/news/rss.xml")
Source.create!(:name => 'Daily Mail', :url => "http://www.dailymail.co.uk/home/index.rss")
Source.create!(:name => "CNN", :url => "http://rss.cnn.com/rss/edition.rss")
Source.create!(:name => 'FOX News', :url => "http://feeds.foxnews.com/foxnews/latest")


