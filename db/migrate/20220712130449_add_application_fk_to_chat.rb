class AddApplicationFkToChat < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :chats, :applications
  end
end
