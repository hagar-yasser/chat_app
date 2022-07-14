class ChatsController < ApplicationController
  def create
    # make a transaction to the applications table to increment the chats_count first
    # @chat=Chat.new(name: params[:name])
    # @application.save
    # render json: {
    #   token: @applicaton.token
    #   name: @application.name
    #   chats_count: @application.chats_count
    # }
    Application.transaction do
      application=Application.where("token = :token",{token: params[:app_token]})[0]
      application.lock!
      application.chats_count= application.chats_count + 1
      application.save!
      
      # application.update(
      #   chats_count: application.chats_count + 1)
      @chat = Chat.new(number: application.chats_count, applications_id: application.id)
      @chat.save!
    end
    render json:@chat.to_json( only:[:number])
  end
  def show
    application=Application.where("token = :token",{token: params[:app_token]})[0]
    chats=Chat.where("applications_id = :applications_id",{applications_id: application.id})
    render json: chats.to_json( only:[:number,:messages_count])

  end
  def update

  end
end
