class SearchController < ApplicationController
    def search
        application=Application.where("token = :token",{token: params[:app_token]})[0]
        chat=Chat.where("applications_id = :applications_id and number= :chat_no",{applications_id: application.id,chat_no: params[:chat_no]})[0] 
        puts chat.id
        messages = Message.search_in_chat(params[:query],chat.id)
        render json: messages.map{|m|{"number":m.number,"body":m.body}}
        
    end
end
