class AddIndexBlogsUserId < ActiveRecord::Migration[5.2]
  def change
    add_index :blogs, :user_id, unique: true 
  end
end
