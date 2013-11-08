class Source < ActiveRecord::Base

  attr_accessible :name, :url

  has_many :posts

  validates_uniqueness_of :name

  def read_rss
    open(self.url) do |http|
      response = http.read
      @result = RSS::Parser.parse(response, false)
    end
    bodies = []
    @result.items.each do |item|
      puts item.hash
      url = URI.parse(item.link)
      req = Net::HTTP::Get.new(url.path)
      res = Net::HTTP.start(url.host, url.port) do |http|
        http.request(req)
      end
      bodies << res.body
    end

    # title
    # description
    # link
    # hash


    bodies
  end

end
