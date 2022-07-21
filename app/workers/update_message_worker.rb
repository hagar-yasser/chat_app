class UpdateMessageWorker 
    include Sidekiq::Worker
    sidekiq_options retry: true
    def perform (token,chat_no,message_no,body)
        application=Application.where("token = :token",{token: token})[0]
        chat=Chat.where("applications_id = :applications_id and number= :chat_no",{applications_id: application.id,chat_no: chat_no})[0]
        message=Message.where("chats_id = :chats_id and number = :message_no",{chats_id: chat.id,message_no: message_no})[0]  
        message.body=body
        message.save
    end
end