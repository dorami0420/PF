class CreateStrayCats < ActiveRecord::Migration[6.1]
  def change
    create_table :stray_cats do |t|

      t.timestamps
    end
  end
end
