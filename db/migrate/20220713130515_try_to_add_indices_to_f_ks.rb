class TryToAddIndicesToFKs < ActiveRecord::Migration[5.0]
  def change
    add_index :chats , :applications_id
    add_index :messages , :chats_id
  end
end
