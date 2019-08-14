class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :blog_id, :unique=> true, :null => false
      t.text :body, :null => false
      t.integer :user_id, :unique => true, :null => false

      t.timestamps
    end
  end
end
