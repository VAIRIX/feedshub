module Feedshub
  class GithubFeedEntry < ActiveRecord::Base

    LAST_ADDED = 10

    scope :last_added, -> { order('published DESC').limit(LAST_ADDED) }

  end
end
