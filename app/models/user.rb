class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  has_many :blogs, dependent: :destroy
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :authentication_keys => [ :login ]
  attr_accessor :login
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
         where(conditions).where(["user_id = :value OR lower(email) = lower(:value)", { value: login}]).first
    else
      where(conditions).first
    end
  end

  def remember_me
    true
  end

end
