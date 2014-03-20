every 2.minutes do
  rake "feeds:update_feeds", environment: 'development'
end

every 30.minutes do
  rake "feeds:update_feeds", environment: 'production'
end
