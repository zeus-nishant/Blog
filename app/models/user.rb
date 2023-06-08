class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
       
  validates :username, presence: true, uniqueness: true

  has_many :follows_as_follower, foreign_key: :follower_id, class_name: "Follow"
  has_many :followed_users, through: :follows_as_follower, source: :followed
  
  has_many :follows_as_followed, foreign_key: :followed_id, class_name: "Follow"
  has_many :followers, through: :follows_as_followed, source: :follower
end
