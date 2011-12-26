class UserMailer < ActionMailer::Base
  default from: "fichas@acme.com"

  def welcome_email(user)
    @user = user
    @url  = "http://uribe:300/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
