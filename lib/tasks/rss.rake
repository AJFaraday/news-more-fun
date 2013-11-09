namespace :rss do

  desc "Pull in the last 10 articles from all sources"
  task :pull => :environment do
    Source.all.each do |source|
      puts "Clearing old and un-subbed articles from #{source.name}"
      source.purge_posts
      puts "Getting articles from #{source.name}"
      source.write_posts
    end
  end

end

