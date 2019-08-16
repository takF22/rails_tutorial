class Comment < ApplicationRecord
    belongs_to :blog
    belongs_to :user
    validates :body, presence: true,
    length: { maximum: 500}
end
