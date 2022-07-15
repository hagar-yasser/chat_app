class CreateMessageWorker
    include Sidekiq::Worker
    sidekiq_options retry: false
    def perform (app_token,chat_no,body)
        Chat.transaction do
        application=Application.where("token = :token",{token: app_token})[0]
        chat=Chat.where("applications_id = :applications_id and number= :chat_no",{applications_id: application.id,chat_no: chat_no})[0]
        chat.lock!
        chat.messages_count=chat.messages_count+1
        chat.save!
        @message=Message.new(number: chat.messages_count,body: body,chats_id: chat.id)
        @message.save!
        end
    end
end