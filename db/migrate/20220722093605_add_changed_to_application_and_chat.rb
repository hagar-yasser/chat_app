class AddChangedToApplicationAndChat < ActiveRecord::Migration[5.0]
  def change
    add_column :applications , :changed , :boolean , :default => false
    add_column :chats , :changed , :boolean , :default => false
  end
end
