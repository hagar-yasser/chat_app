class ChangeCountFieldsDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :applications , :chats_count , from: nil , to:0
    change_column_default :chats , :messages_count , from: nil , to:0
  end
end
