class CreateStrayCats < ActiveRecord::Migration[6.1]
  def change
    create_table :stray_cats do |t|
      t.string :color
      t.string :place
      t.text :caption
      t.integer :user_id
      t.timestamps
      t.string :address
      t.float :latitude
      t.float :longitude
    end
  end
end
