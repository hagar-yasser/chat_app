class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :token , :name , :chats_count
end
