class CreateChatWorker 
    include Sidekiq::Worker
    sidekiq_options retry: true
    def prin
        puts "here"
    end
    def perform (token,number)  
        Application.transaction do
            application=Application.where("token = :token",{token: token})[0]
            # application.lock!
            # application.chats_count= application.chats_count + 1
            # application.save!
            application.has_different_count=true
            application.save!
            chat = Chat.new(number: number, applications_id: application.id)
            chat.save!
        end
    
    end
end