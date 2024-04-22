class ProfilesController < ApplicationController
  def new
    redirect_to profile_path(current_user.profile) if current_user.profile

    @profile = Profile.new
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
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:info, :profile_picture_url)
  end
end
