class Post < ActiveRecord::Base

  attr_accessible :headline, :hash, :body, :rss_link

  belongs_to :source
  
end
