class UserMailer < ApplicationMailer
  default from: 'joerator.com'

  def welcome_email(user)
    @user = user

    mail to: @user.email, subject: "Welcome to joerator!"
  end

  def review_removed_email(user, coffeeshop)
    @user = user
    @coffeeshop = coffeeshop

    mail to: @user.email, subject: "Your Joerator email was removed by admin"
  end


end
