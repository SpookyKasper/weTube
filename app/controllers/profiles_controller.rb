class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      flash[:notice] = 'Your profil information was successfully saved'
      redirect_to @profile
    else
      flash[:alert] = 'There was a problem when saving your profile information'
      render :new, status: 422 # unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:info, :profile_picture_url)
  end
end
