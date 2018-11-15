class UserMailer < ApplicationMailer
  default from: 'from@from.from'

  def welcome_mail(user)
    @user = user
    @url = '99cats.com'
    mail(to: "everybody@appacademy.io", subject: 'Welcome Loser!')
  end
end
