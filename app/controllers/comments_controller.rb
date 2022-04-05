class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("new_comments_post_#{@post.id}",
                                partial: "comments/form",
                                locals: {post: @comment.post}),

            turbo_stream.update("new_comments_post_#{@post.id}_index",
                                partial: "comments/form_comment_index",
                                locals: {post: @comment.post}),

            turbo_stream.replace("last_comment_post_#{@post.id}", @post.last_current_user(current_user)),

            turbo_stream.update("comments_count_post_#{@post.id}", @post.count),

            turbo_stream.append("comments_post_#{@post.id}",
                                 partial: "posts/comments",
                                 locals: { comment: @comment })
          ]
        end
      end

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
