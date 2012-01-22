class MailSubmissions < ActionMailer::Base
  default from: "fichas@acme.net"

  def notify_submission_new(user)
    @user = user
    @administrative_manager_official = DepartmentsManager.find(
      :all,
      :conditions => {
        :deputy => false,
        :department_id => User.find(@user.id).departments_members(
          :conditions => {
            :administrative_department => true
          }
        ).first.department_id
      }
    ).first.user
    mail( :to => user.email, 
          :cc => @administrative_manager_official.email,
          :subject => "[Working Days] New Submission" 
    )
  end
end
