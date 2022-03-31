class PagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @posts = Post.all.order(created_at: :desc)
  end

end
