require "redis"
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
    host=ENV['REDIS_HOST']||'localhost'
    port=ENV['REDIS_PORT']||6379
    db =ENV['REDIS_DB']||3
    redis=Redis.new(host: host, port:port, db: db)
    message_no=redis.incr(params[:app_token]+"#"+params[:chat_no])
    CreateMessageWorker.perform_async(params[:app_token],params[:chat_no],params[:body],message_no)
    render json:{number: message_no,body: params[:body]},status: 200
  end
  def show
    application=Application.where("token = :token",{token: params[:app_token]})[0]
    chat=Chat.where("applications_id = :applications_id and number = :chat_no",{applications_id: application.id,chat_no: params[:chat_no]})[0]
    messages=Message.where("chats_id = :chats_id",{chats_id: chat.id})
    render json:messages.to_json(only:[:number,:body])
  end
  def update
    
    UpdateMessageWorker.perform_async(params[:app_token],params[:chat_no],params[:message_no],params[:body])
    # render json: {number: params[:message_no],body: params[:body]},status: 200
    render json: {message: "Message Body Updated!"},status: 200

  end
end
