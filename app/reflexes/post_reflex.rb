# frozen_string_literal: true

class PostReflex < ApplicationReflex
  def like
    post = Post.find(element.dataset[:post_id])
    user = User.find(element.dataset[:user_id])
    like = post.likes.where(user_id: user).count

    if like == 0
      Like.create!(user_id: user.id, object: post)
    else
      removeLike = Like.where(user_id: user.id, object: post)
      Like.delete(removeLike)
    end
  end

  def create_comment
    content = element.dataset[:content]
    p content
  end
end
