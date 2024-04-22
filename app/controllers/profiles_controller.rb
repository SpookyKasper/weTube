class ProfilesController < ApplicationController
  def new
  end

  def create
    @profile = Profile.new(profile_params)
  end

  private

  def profile_params
    params.require(:profile).permit(:user_info,)
  end
end
