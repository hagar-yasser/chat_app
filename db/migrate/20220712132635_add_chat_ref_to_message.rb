class AddChatRefToMessage < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :chats, index: false
  end
end
