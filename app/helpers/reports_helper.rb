module ReportsHelper

  def submission_status(user_id, date)
    @s = Submission.find(:first, :conditions => { :submitter_id => user_id, :period_end => date } )
    if @s.nil?
      return "Not submitted"
    elsif @s.approver_id.nil?
      return "Submitted"
    else
      return "Approved"
    end
  end

end
