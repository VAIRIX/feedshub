namespace :feeds do

  desc 'Update feeds from GitHub'
  task update_feeds: :environment do
    require 'feedshub/feeds/git_feeds_handler'
    GitFeedsHandler.update_github_feeds
  end

  desc 'Add cron task to update feeds'
  task schedule: :environment do
    exec("whenever -i -r #{Rails.env} -f config/feedshub/schedule.rb")
  end

end