class CreateMessageWorker
    include Sidekiq::Worker
    sidekiq_options retry: false
    def perform (messages_count,chats_id,body)
        message=Message.new(number: messages_count,body: body,chats_id: chats_id)
        message.save!
    end
end