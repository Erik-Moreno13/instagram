class Post < ApplicationRecord
  #Asociaciones
  belongs_to :user
  has_many :comments
  has_one_attached :image
  has_many :likes, as: :object
  validates :image, :description, presence: true

  def name_users(post)
    if post.likes.count > 0
      like = post.likes.first
      user = User.find(like.user_id)
      user.username

      if post.likes.count > 2
        "liked by #{user.username} and #{post.likes.count - 1} others"
      elsif post.likes.count == 2
        "liked by #{user.username} and other person"
      elsif post.likes.count == 1
        "liked by #{user.username}"
      else
        ""
      end
    end
  end

  def count
    if comments.count == 1
      "View #{comments.count} comment"
    elsif comments.count > 1
      "View all #{comments.count} comments"
    end
  end

  def last_current_user(user)
    last_comment = comments.last
    if last_comment.user == user
      "#{last_comment.user.username} #{last_comment.content}"
    end
  end

end
