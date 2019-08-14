class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  # presence で特定のカラムが空でないことをチェックします
validates :title, presence: true
validates :content, presence: true
validates :user_id, presence: true
end
