module Feedshub
  module FeedsHelper
    def github_feeds
      @entries = Feedshub::GithubFeedEntry.last_added
      render partial: 'feedshub/feeds/github_feeds'
    end
  end
end
