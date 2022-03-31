class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @post = @user.posts
    @fol = @user.followers.where(follower: current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
