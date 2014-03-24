module Feedshub
  class GithubFeedEntry < ActiveRecord::Base
    # Fixme: maybe we need to change the name of scope
    scope :last_added, ->(limit) do
    	if limit.is_a?(Integer) && limit > 0
    		order(published: :desc).limit(limit)
    	else
    		order(published: :desc)
    	end
    end

  end
end
