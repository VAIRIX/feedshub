module Feedshub
  class GithubFeedEntry < ActiveRecord::Base

    def self.public_feeds(limit = ENV['github_feeds_number'].to_i)
      GithubFeedEntry.order('published DESC').limit(limit)
    end

  end
end
