class UsersController < ApplicationController
  def index
    @users = User.all
    @following = Following.new
    @followees = current_user.followees
  end

  def edit
  end
end
