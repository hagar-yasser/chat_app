class RemoveAppTokenFromChats < ActiveRecord::Migration[5.0]
  def change
    remove_column :chats, :app_token, :string
  end
end
