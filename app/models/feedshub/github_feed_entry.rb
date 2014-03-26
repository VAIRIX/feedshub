module Feedshub
  class GithubFeedEntry < ActiveRecord::Base

    LAST_ADDED = 10

    scope :public_feeds, -> (limit = nil) { order(published: :desc).limit(limit.blank? ? ENV['github_feeds_number'].to_i : limit) }

  end
end
