class UserMailer < ApplicationMailer
  default from: 'joerator.com'

  def welcome_email(user)
    @user = user

    mail to: @user.email, subject: "Welcome to joerator!"
  end
end
