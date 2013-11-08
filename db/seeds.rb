# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# 
# RSS sources
#
Source.create(:name => "BBC News", :url => "http://feeds.bbci.co.uk/news/rss.xml", :body_xpath => '//*[@id="main-content"]/div/div/p')
Source.create(:name => 'Daily Mail', :url => "http://www.dailymail.co.uk/home/index.rss", :body_xpath => '//*[@id="js-article-text"]/p')
Source.create(:name => "CNN", :url => "http://rss.cnn.com/rss/edition.rss", :body_xpath => '//*[@id="cnnContentContainer"]/div/p')
Source.create(:name => 'FOX News', :url => "http://feeds.foxnews.com/foxnews/latest", :body_xpath => '//*[@id="content"]/div/div/div/div/div/article/div/div/p')

#
# substitutions (from http://xkcd.com/1288/)
#
Substitution.create(:from => 'witnesses',:to => 'these dudes I know')
Substitution.create(:from => 'witness',:to => 'this dude I know')
Substitution.create(:from => 'allegedly',:to => 'kinda probably')
Substitution.create(:from => 'new study',:to => 'tumblr post')
Substitution.create(:from => 'rebuild',:to => 'avenge')
Substitution.create(:from => 'space',:to => 'spaaaaace')
Substitution.create(:from => 'google glass',:to => 'virtual boy')
Substitution.create(:from => 'smartphone',:to => 'tricorder')
Substitution.create(:from => 'electric',:to => 'atomic')
Substitution.create(:from => 'senator',:to => 'elf-lord')
Substitution.create(:from => 'car',:to => 'cat')
Substitution.create(:from => 'election',:to => 'eating contest')
Substitution.create(:from => 'congressional leaders',:to => 'river spirits')
Substitution.create(:from => 'homeland security',:to => 'homestar runner')
Substitution.create(:from => 'could not be reached for comment',:to => 'is guilty and everyone knows it')
