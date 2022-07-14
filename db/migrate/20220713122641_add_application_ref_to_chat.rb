class AddApplicationRefToChat < ActiveRecord::Migration[5.0]
  def change
    add_reference :chats, :applications, index: false
  end
end
