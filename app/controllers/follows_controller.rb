class FollowsController < ApplicationController
  def create
    other_user = User.find(params[:user_id])
    @fol = Follow.new(follower_id: current_user.id,
                      followed_id: other_user.id)
    @fol.save
    redirect_to user_posts_path(other_user)
  end

  def destroy
    @fol = Follow.find_by(followed_id: params[:id])
    @fol.destroy
    redirect_to user_posts_path(@fol.followed.id)
  end
end
