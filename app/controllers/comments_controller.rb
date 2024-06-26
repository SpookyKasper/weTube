class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:comment][:post_id])

    if @comment.save
      redirect_to @post
    else
      render :post, status: 422
    end
  end

  def edit
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :body)
  end
end
