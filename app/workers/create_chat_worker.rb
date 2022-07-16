class CreateChatWorker 
    include Sidekiq::Worker
    sidekiq_options retry: false
    def prin
        puts "here"
    end
    def perform (chats_count,app_id)    
        # application.update(
        #   chats_count: application.chats_count + 1)
        # chat = Chat.new(number: application.chats_count, applications_id: application.id)
        chat = Chat.new(number: chats_count, applications_id: app_id)
        chat.save!
    
    end
end