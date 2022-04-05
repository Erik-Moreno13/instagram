class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :likes, as: :object
  validates :content, presence: true


  def change_color(current_user)
    "text-red-500" if likes.where(user_id: current_user).count == 1
  end

  def change_class(current_user)
    likes.where(user_id: current_user).count == 0 ? "regular" : "solid"
  end
end
