class ChangeDataUserIdToBlog < ActiveRecord::Migration[5.2]
  def change
    change_column :blogs, :user_id, :string
  end
end
