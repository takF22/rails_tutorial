class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title, :null => false
      t.text :content, :null => false
      t.integer :user_id, :unique => true, :null => false
      t.timestamps
    end
  end
end
