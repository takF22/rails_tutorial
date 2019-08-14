class DeleteUserIdIdUniqIndexFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_index :blogs, :user_id
  end
end
