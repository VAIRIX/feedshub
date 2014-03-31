namespace :feeds do

  desc 'update feeds from GitHub'
  task update_feeds: :environment do
    require 'feedshub/feeds/git_feeds_handler'
    GitFeedsHandler.update_github_feeds
  end

  desc 'add cron task to update feeds'
  task whenverize: :environment do
    exec("cd #{Feedshub::Engine.root} && whenever -i -s 'path=#{Rails.root}' -r #{Rails.env}")
  end

end