module Feedshub
  module FeedsHelper
    def github_feeds(limit=nil)
      @entries = Feedshub::GithubFeedEntry.public_feeds(limit)
      render partial: 'feedshub/feeds/github_feeds'
    end
  end
end
