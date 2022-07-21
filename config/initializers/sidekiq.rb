# require 'redis-namespace'
# Sidekiq.configure_server do |config|
#   config.redis = { url: 'redis://localhost:6379/2' }
# end
# Sidekiq.configure_client do |config|
#   config.redis = { url: 'redis://localhost:6379/2' }
# end
# Sidekiq.configure_server{|config| config.redis = redis_config }
# Sidekiq.configure_client{|config| config.redis = redis_config }
Sidekiq.configure_server do |config|
  config.redis = {
    host: ENV['REDIS_HOST'] ,
    port: ENV['REDIS_PORT'] || '6379'
    
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'] || '6379'
   
  }
end