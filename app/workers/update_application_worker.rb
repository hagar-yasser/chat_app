class UpdateApplicationWorker 
    include Sidekiq::Worker
    sidekiq_options retry: true
    def perform (application,name)  
        application.name=name
        application.save
    end
end