class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to(user_post_path(@post.user, @post))
    else
      render action: 'new'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit :content, :post_id, :user_id
  end
end
