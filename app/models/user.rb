class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments
  #Asociación con los seguidores de la cuenta
  has_many :followers, class_name: 'Follow', foreign_key: 'followed_id'
  #Asociación con los que la cuenta está siguiendo
  has_many :following, class_name: 'Follow', foreign_key: 'follower_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def show_followed(follower, user)
    user.followers.where(follower: follower).count
  end
end