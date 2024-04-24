class UserMailer < ApplicationMailer
  default from: 'daniel@soundmetaphors.com'

  def welcome_email
    @user = params[:user]
    @url = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Thanks for joining Wetube')
  end
end
