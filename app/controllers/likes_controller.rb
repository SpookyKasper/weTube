class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    if @like.save
      redirect_to :posts
    else
      render :posts, status: 422
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      redirect_to :posts
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
