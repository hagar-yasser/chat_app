# require "redis"
class ChatsController < ApplicationController
  def create
    # Application.transaction do
    #         application=Application.where("token = :token",{token: params[:app_token]})[0]
    #         application.lock!
    #         application.chats_count= application.chats_count + 1
    #         application.save!
            
    #         # application.update(
    #         #   chats_count: application.chats_count + 1)
    #         @chat = Chat.new(number: application.chats_count, applications_id: application.id)
    #         @chat.save!
    # end
    host=ENV['REDIS_HOST']||'localhost'
    port=ENV['REDIS_PORT']||6379
    db =ENV['REDIS_DB']||3
    redis=Redis.new(host: host, port:port, db: db)
    chat_no=redis.incr(params[:app_token])
    CreateChatWorker.perform_async(params[:app_token],chat_no)
    render json:{number:chat_no,messages_count:0},status:200
  end
  def show
    application=Application.where("token = :token",{token: params[:app_token]})[0]
    chats=Chat.where("applications_id = :applications_id",{applications_id: application.id})
    render json: chats.to_json( only:[:number,:messages_count])

  end
  def update

  end
end
