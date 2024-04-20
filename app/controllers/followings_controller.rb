class FollowingsController < ApplicationController
  def create
    @following = Following.new(following_params)

    if @following.save
      redirect_to users_path
    else

    end
  end

  def destroy
    @following = Following.find(params[:id])
    return unless @following.destroy

    redirect_to users_path
  end

  private

  def following_params
    params.require(:following).permit(:followee_id, :follower_id)
  end
end
