class AddIndexToChangedCols < ActiveRecord::Migration[5.0]
  def change
    add_index :applications , :changed
    add_index :chats , :changed

  end
end
