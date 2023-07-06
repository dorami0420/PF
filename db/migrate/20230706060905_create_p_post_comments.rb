class CreatePPostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :p_post_comments do |t|
  t.text :comment
      t.integer :user_id
      t.integer :protective_cat_id

      t.timestamps
    end
  end
end
