class CreateProtectiveCats < ActiveRecord::Migration[6.1]
  def change
    create_table :protective_cats do |t|

      t.timestamps
    end
  end
end
