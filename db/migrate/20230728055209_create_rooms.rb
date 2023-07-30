class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :owner, foreign_key: { to_table: :users }, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
      t.index [:owner_id, :user_id], unique: true
    end
  end
end
