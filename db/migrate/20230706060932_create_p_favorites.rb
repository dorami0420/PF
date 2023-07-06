class CreatePFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :p_favorites do |t|
      t.integer :user_id
      t.integer :protective_cat_id

      t.timestamps
    end
  end
end
