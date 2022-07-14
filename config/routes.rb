Rails.application.routes.draw do
  defaults format: :json do

    get 'applications/:app_token', to: 'applications#show'
    post 'applications/' , to: 'applications#create'
    put 'applications/:app_token' , to: 'applications#update'

    get 'applications/:app_token/chats', to: 'chats#show'
    post 'applications/:app_token/chats', to: 'chats#create'
    # put 'applications/:app_token/chats', to: 'chats#update'


    get 'applications/:app_token/chats/:chat_no/messages', to: 'messages#show'
    post 'applications/:app_token/chats/:chat_no/messages', to: 'messages#create'
    put 'applications/:app_token/chats/:chat_no/messages/:message_no', to: 'messages#update'

    get 'applications/:app_token/chats/:chat_no/messages/search',to: 'search#search'

   

  end
 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
