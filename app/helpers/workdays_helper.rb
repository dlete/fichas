module WorkdaysHelper

  def submission_status(user_id, date)
    @s = Submission.find(:first, :conditions => { :submitter_id => user_id, :period_begin => date } )
    if @s.nil?
      return "Not Submitted"
    elsif @s.approver_id.nil?
      return "Submitted, pending Approval"
    else
      return "Submitted and Approved"
    end
  end

end
