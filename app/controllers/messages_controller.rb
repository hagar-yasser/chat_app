class MessagesController < ApplicationController
  def create
    # Chat.transaction do
    #   application=Application.where("token = :token",{token: params[:app_token]})[0]
    #   chat=Chat.where("applications_id = :applications_id and number= :chat_no",{applications_id: application.id,chat_no: params[:chat_no]})[0]
    #   chat.lock!
    #   chat.messages_count=chat.messages_count+1
    #   chat.save!
    #   @message=Message.new(number: chat.messages_count,body: params[:body],chats_id: chat.id)
    #   @message.save!
    # end
    # render json: @message.to_json(only:[:number])
    application=Application.where("token = :token",{token: params[:app_token]})[0]
    chat=Chat.where("applications_id = :applications_id and number= :chat_no",{applications_id: application.id,chat_no: params[:chat_no]})[0]
    Chat.transaction do
        chat.lock!
        chat.messages_count=chat.messages_count+1
        chat.save!
    end
    CreateMessageWorker.perform_async(chat.messages_count,chat.id,params[:body])
    render json:{number: chat.messages_count,body: params[:body]},status: 200
  end
  def show
    application=Application.where("token = :token",{token: params[:app_token]})[0]
    chat=Chat.where("applications_id = :applications_id and number = :chat_no",{applications_id: application.id,chat_no: params[:chat_no]})[0]
    messages=Message.where("chats_id = :chats_id",{chats_id: chat.id})
    render json:messages.to_json(only:[:number,:body])
  end
  def update
    application=Application.where("token = :token",{token: params[:app_token]})[0]
    chat=Chat.where("applications_id = :applications_id and number= :chat_no",{applications_id: application.id,chat_no: params[:chat_no]})[0]
    message=Message.where("chats_id = :chats_id and number = :message_no",{chats_id: chat.id,message_no: params[:message_no]})[0]
    message.body=params[:body]
    message.save
    render json: message.to_json(only:[:number,:body])
  end
end
