class CreateProtectiveCats < ActiveRecord::Migration[6.1]
  def change
    create_table :protective_cats do |t|
      t.string :name
      t.string :neuter
      t.string :color
      t.string :place
      t.string :gender
      t.text :health
      t.text :caption
      t.integer :user_id
      t.timestamps
    end
  end
end
