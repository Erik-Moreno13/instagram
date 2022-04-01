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

  def change_class_button(follower, followed)
    if Follow.where(follower_id: follower.id, followed_id: followed.id).count == 0
      "text-white hover:bg-blue-300 rounded-md py-[3px] bg-blue-400 h-[30px] w-[100px] border-[1px] border-gray-400 text-center text-sm font-semibold"
    else
      "rounded-md py-[3px] h-[30px] w-[100px] border-[1px] border-gray-400 text-center text-sm"
    end
  end

  def p_visibly(follower, followed)
    if Follow.where(follower_id: follower.id, followed_id: followed.id).count == 0
      ""
    else
      "hidden"
    end
  end

  def i_visibly(follower, followed)
    if Follow.where(follower_id: follower.id, followed_id: followed.id).count == 0
      "hidden"
    else
      "fa-solid fa-user-check"
    end
  end
end