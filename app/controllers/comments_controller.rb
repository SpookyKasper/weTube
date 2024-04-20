class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
  end

  def edit
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :body)
  end
end
