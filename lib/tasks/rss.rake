namespace :rss do

  desc "Pull in the last 10 articles from all sources"
  task :pull => :environment do
    Source.all.each do |source|
      puts "Clearing sub-average articles from #{source.name}"
      source.purge_posts
      puts "Getting articles from #{source.name}"
      source.write_posts
      puts "Removing posts without substitutions - you don't want these"
      source.remove_unchanged_posts
    end
  end

end

