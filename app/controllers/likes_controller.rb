class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    if @like.save
      puts 'peak time'
    else
      puts 'not good'
    end
  end

  def destroy
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
