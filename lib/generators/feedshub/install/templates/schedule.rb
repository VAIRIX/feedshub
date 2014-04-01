every 2.minutes, :roles => [:development] do
  rake 'feeds:update_feeds', environment: 'development'
end

every 30.minutes, :roles => [:production] do
  rake 'feeds:update_feeds', environment: 'production'
end