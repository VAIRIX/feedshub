require 'rest_client'
require 'feedjira'

module GitFeedsHandler

  GITHUB_URL      = 'https://github.com'

  def self.retrieve_org_members_links
    url           = "https://api.github.com/orgs/#{ENV['org_name']}/members"
    result        = RestClient.get(url)
    parsed_result = YAML.load(result.gsub(/\=>/, ': '))
    parsed_result.map{ |member| "#{member['html_url']}.atom" }
  end

  def self.fetch_and_create_feeds_enrties(links)
    feeds = Feedjira::Feed.fetch_and_parse(links)
    links.each do |link|
      GitFeedsHandler.add_entries(feeds[link].entries)
    end
  end

  def self.update_github_feeds
    links = if ENV['org_name']
      GitFeedsHandler.retrieve_org_members_links
    elsif ENV['user_name']
      ["#{GITHUB_URL}/#{ENV['user_name']}.atom"]
    end
    GitFeedsHandler.fetch_and_create_feeds_enrties links
  end

  private

  def self.process_content(content)
    content.gsub(/href="\//, "href=\"#{GITHUB_URL}/")
  end

  def self.add_entries(entries)
    entries.each do |entry|
      unless Feedshub::GithubFeedEntry.where(entry_id: entry.entry_id).first
        feed_entry = Feedshub::GithubFeedEntry.new
        feed_entry.entry_id = entry.entry_id
        feed_entry.published = entry.published
        feed_entry.updated = entry.updated
        feed_entry.url = entry.url
        feed_entry.title = entry.title
        feed_entry.author = entry.author
        feed_entry.content = GitFeedsHandler.process_content(entry.content)
        feed_entry.save!
      end
    end
  end

end
