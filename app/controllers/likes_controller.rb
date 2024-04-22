class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: params[:user_id], post_id: params[:post_id])
    if @like.save
      redirect_back(fallback_location: :root)
    else
      render :posts, status: 422
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      redirect_back(fallback_location: :root)
    else

    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
