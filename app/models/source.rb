class Source < ActiveRecord::Base

  attr_accessible :name, :url, :body_xpath

  has_many :posts

  validates_uniqueness_of :name


  #
  # Use this to find the xpath of the main body of the story
  #
  def first_link
    open(self.url) do |http|
      response = http.read
      @result = RSS::Parser.parse(response, false)
    end
    @result.items[0].link
  end

  def read_rss
    open(self.url) do |http|
      response = http.read
      @result = RSS::Parser.parse(response, false)
    end
    articles = []
    @result.items[0..9].each do |item|
      puts item.hash
      puts item.link
      url = URI.parse(item.link)
      req = Net::HTTP::Get.new(url.path)
      res = Net::HTTP.start(url.host, url.port) do |http|
        http.request(req)
      end
      articles << [item, res.body]
    end

    if self.body_xpath
      articles = articles.collect do |item,body|
        doc = Nokogiri::HTML(body)
        elements = doc.xpath(self.body_xpath)
        {:rss => item, :article => elements.collect{|x|x.to_s}.join(' ')}
      end
    end
    articles
  end

  def write_posts
    articles = self.read_rss
    articles.each do |article|
      unless Post.find_by_rss_link(article[:rss].link)
        puts self.posts.create!(
          :headline => article[:rss].title,
          :rss_link => article[:rss].link,
          :body => article[:article] 
        ).inspect
      end
    end
  end

end
