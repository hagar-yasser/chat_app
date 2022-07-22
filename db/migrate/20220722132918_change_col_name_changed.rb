class ChangeColNameChanged < ActiveRecord::Migration[5.0]
  def change
    rename_column :applications, :changed, :has_different_count
    rename_column :chats, :changed, :has_different_count
  end
end
