class ProfilesController < ApplicationController
  def new
    redirect_to profile_path(current_user.profile) if current_user.profile

    @profile = Profile.new
    @profile_picture = session[:profile_picture_path] || 'user-default.svg'
  end

  def create
    @user = current_user
    @profile = @user.build_profile(profile_params)

    if @profile.save
      flash[:notice] = 'Your profil information was successfully saved'
      redirect_to @profile
    else
      flash[:alert] = 'There was a problem when saving your profile information'
      render :new, status: 422 # unprocessable_entity
    end
  end

  def show
    @profile = Profile.includes(:user).find(params[:id])
    @user = @profile.user
  end

  def edit
    @profile = Profile.includes(:user).find(params[:id])
  end

  def update
    @profile = Profile.includes(:user).find(params[:id])

    if @profile.update(profile_params)
      redirect_to @profile
    else
      flash[:alert] = "Oops"
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:info, :profile_picture_path)
  end
end
