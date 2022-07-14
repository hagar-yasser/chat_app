class MessageSerializer < ActiveModel::Serializer
  attributes :id, :chats_id , :body ,:number
end
