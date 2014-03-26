module Feedshub
  class GithubFeedEntry < ActiveRecord::Base

    scope :public_feeds, -> (limit = ENV['github_feeds_number'].to_i) { order(published: :desc).limit(limit) }

  end
end
