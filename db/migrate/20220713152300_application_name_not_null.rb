class ApplicationNameNotNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :applications , :name , false
  end
end
