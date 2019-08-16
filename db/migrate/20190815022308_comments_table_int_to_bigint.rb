class CommentsTableIntToBigint < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.connection.execute "ALTER TABLE `comments` MODIFY `id` BIGINT NOT NULL AUTO_INCREMENT;"
  end
end
