class AddColumnsToRoomUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :room_users do |t|
    t.references :room, foreign_key: true
    t.references :user, foreign_key: true
    end
  end
end