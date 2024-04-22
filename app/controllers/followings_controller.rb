class FollowingsController < ApplicationController
  def create
    @user = current_user
    @following = @user.followed_users.build(followee_id: params[:followee_id])

    if @following.save
      redirect_to users_path
    else

    end
  end

  def destroy
    @following = Following.find_by(follower_id: current_user.id, followee_id: params[:id])
    return unless @following.destroy

    redirect_to users_path
  end

  private

  def following_params
    params.require(:following).permit(:followee_id, :follower_id)
  end
end
