class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :token, index: { unique: true, name: 'unique_tokens' }, null: false
      t.string :name
      t.integer :chats_count

      t.timestamps
    end
  end
end
