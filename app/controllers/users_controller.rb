class UsersController < ApplicationController
  def index
    @users = User.includes(:profile).all
    @following = Following.new
    @followees = current_user.followees

    @profile_picture_path = current_user.profile.profile_picture_path || session[:profile_picture_path]
  end

  def edit
  end
end
