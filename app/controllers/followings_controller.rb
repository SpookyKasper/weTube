class FollowingsController < ApplicationController
  def create
    @following = Following.new(following_params)

    if @following.save
      puts 'peak time'
    else

    end
  end

  private

  def following_params
    params.require(:following).permit(:followee_id, :follower_id)
  end
end
