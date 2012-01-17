class MailSubmissions < ActionMailer::Base
  default from: "fichas@acme.net"

  def notify_submission_new(user)
    @user = user
    mail( :to => user.email, :subject => "[Working Days] New Submission" )
  end
end
