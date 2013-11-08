class Post < ActiveRecord::Base

  attr_accessible :headline, :hash, :body, :rss_link,:sub_count

  belongs_to :source

  before_save :make_substitutions

  def make_substitutions
    self.sub_count ||= 0
    Substitution.all.each do |sub|
      if self.body.include?(sub.from)
        self.sub_count += self.body.scan(/#{sub.from}/).count
        self.body.gsub!(sub.from, sub.to)
      end
    end
  end
  
end
