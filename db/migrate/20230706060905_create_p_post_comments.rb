class CreatePPostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :p_post_comments do |t|

      t.timestamps
    end
  end
end
