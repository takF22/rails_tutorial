class UsersTableIntToBigint < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.connection.execute "ALTER TABLE `users` MODIFY `id` BIGINT NOT NULL AUTO_INCREMENT;"
  end
end
