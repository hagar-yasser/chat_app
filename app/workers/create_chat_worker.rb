class CreateChatWorker 
    include Sidekiq::Worker
    sidekiq_options retry: false
    def prin
        puts "here"
    end
    def perform (app_token)
        Application.transaction do
            puts Application.where("token = :token",{token:app_token})
            application=Application.where("token = :token",{token: app_token})[0]
            application.lock!
            application.chats_count= application.chats_count + 1
            application.save!
            
            # application.update(
            #   chats_count: application.chats_count + 1)
            @chat = Chat.new(number: application.chats_count, applications_id: application.id)
            @chat.save!
        end
    end
end