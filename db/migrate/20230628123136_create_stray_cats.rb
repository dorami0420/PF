class CreateStrayCats < ActiveRecord::Migration[6.1]
  def change
    create_table :stray_cats do |t|
      t.text :caption
      t.integer :user_id
      t.timestamps
    end
  end
end
