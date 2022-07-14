class AddForeignKeysToChatsAndMessages < ActiveRecord::Migration[5.0]
  def change
    remove_reference :chats , :applications
    remove_reference :messages , :chats
    add_reference :chats , :applications , foreign_key: true , index: false
    add_reference :messages , :chats , foreign_key: true , index: false


  end
end
