class ChatSerializer < ActiveModel::Serializer
  attributes :id, :applications_id, :messages_count , :number
end
