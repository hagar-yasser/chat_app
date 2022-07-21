class ApplicationsController < ApplicationController
  def create
    application=Application.new(name: params[:name])
    application.save
    render json: application.to_json( only: [:token , :name , :chats_count])
  end
  def show
    application = Application.where("token = :token",{token: params[:app_token]})[0]
    render json: application.to_json( only: [:token , :name , :chats_count])
    # render json:{
    #   token: application.token,
    #   name: application.name,
    #   chats_count:application.chats_count
    # }
  end
  def update
    application=Application.where("token = :token",{token: params[:app_token]})[0]
    UpdateApplicationWorker.perform_async(application,params[:name])
    render json: {token:application.token,name:params[:name],chats_count:application.chats_count},status:200
  end
end
