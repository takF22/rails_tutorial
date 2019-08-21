class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :img, ImgUploader
  # presence で特定のカラムが空でないことをチェックします
  validates :title, presence: true,
    length: {maximum:100}
  validates :content, presence: true,
    length: {maximum:1000}
  validates :user_id, presence: true
end
