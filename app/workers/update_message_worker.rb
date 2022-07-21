class UpdateMessageWorker 
    include Sidekiq::Worker
    sidekiq_options retry: true
    def perform (message,body)  
        message.body=body
        message.save
    end
end