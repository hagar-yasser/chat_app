class UpdateApplicationWorker 
    include Sidekiq::Worker
    sidekiq_options retry: true
    def perform (token,name)  
        application=Application.where("token = :token",{token: token})[0]
        application.name=name
        application.save
    end
end