class BlogsTableIntToBigint < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.connection.execute "ALTER TABLE `blogs` MODIFY `id` BIGINT NOT NULL AUTO_INCREMENT;"
  end
end
