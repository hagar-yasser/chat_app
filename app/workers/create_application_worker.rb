class CreateApplicationWorker 
    include Sidekiq::Worker
    sidekiq_options retry: true
    def perform (application)  
        application.save
    end
end