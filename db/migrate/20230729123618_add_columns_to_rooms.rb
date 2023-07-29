class AddColumnsToRooms < ActiveRecord::Migration[6.1]
  def change
    change_table :rooms do |t|
      t.string :nickname
    end
    
  end
end
