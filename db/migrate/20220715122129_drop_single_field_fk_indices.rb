class DropSingleFieldFkIndices < ActiveRecord::Migration[5.0]
  def change
    remove_index :chats , :applications_id
    remove_index :messages , :chats_id
  end
end
