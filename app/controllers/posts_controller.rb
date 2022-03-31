class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show, :create, :edit, :destroy]

  def new
    @post = @user.posts.build
  end

  def create
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def show
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit :description, :user_id, :image
  end
end
