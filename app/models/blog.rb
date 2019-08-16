class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :img, ImgUploader
  # presence で特定のカラムが空でないことをチェックします
validates :title, presence: true,
length: {maximum:100, message: "タイトルは100文字以下です"}
validates :content, presence: true,
length: {maximum:1000, message: "内容は1000文字以下です"}
validates :user_id, presence: true
end
