class UsersController < ApplicationController
  def index
    @users = User.all
    @following = Following.new
  end

  def edit
  end
end
