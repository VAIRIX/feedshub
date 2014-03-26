module Feedshub
  module FeedsHelper
    def github_feeds(limit=ENV['github_feeds_number'].to_i)
      @entries = Feedshub::GithubFeedEntry.public_feeds(limit)
      render partial: 'feedshub/feeds/github_feeds'
    end
  end
end
