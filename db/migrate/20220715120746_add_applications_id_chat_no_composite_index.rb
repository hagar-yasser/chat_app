class AddApplicationsIdChatNoCompositeIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :chats , [:applications_id, :number]
    add_index :messages, [:chats_id,:number]
  end
end
