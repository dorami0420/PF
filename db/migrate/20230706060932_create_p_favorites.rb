class CreatePFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :p_favorites do |t|

      t.timestamps
    end
  end
end
