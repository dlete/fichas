module ReportsHelper

  def submission_status(user_id, date)
    @s = Submission.find(:first, :conditions => { :submitter_id => user_id, :period_begin => date } )
    if @s.nil?
      return "Not submitted"
    elsif @s.approver_id.nil?
      return "Pending approval"
    else
      return "Approved"
    end
  end

  def submission_hours(user_id, date)
    @submission = Submission.find(:first, :conditions => { :submitter_id => user_id, :period_begin => date } )
    if @submission.nil?
      hours_in_submission = 0
    else
      hours_in_submission = @submission.workdays.sum(:working_hours).to_d
    end
    return hours_in_submission
  end

# ---------------------------------
  def submission_date_user(user_id, date)
    @submission = Submission.find(:first, :conditions => { :submitter_id => user_id, :period_begin => date } )
    return @submission
  end

  def submission_status2(submission)
    if submission.nil?
      @submission_status = "Not submitted"
    elsif submission.approver_id.nil?
      @submission_status = "Pending approval"
    else
      @submission_status = "Approved"
    end
    return @submission_status
  end

  def submission_hours2(submission)
    if submission.nil?
      @hours_in_submission = 0
    elsif submission.approver_id.nil?
      @hours_in_submission = 0
    else
      @hours_in_submission = submission.workdays.sum(:working_hours).to_d
    end
    return @hours_in_submission
  end

  def ah(user_id, date)
    workhours_months = []

    0.upto(3) do |n|
      submission_date = date.months_ago(n).beginning_of_month
      @submission_month = submission_date_user(user_id, submission_date)
      if submission_status2(@submission_month) == "Approved"
        workhours_this_month = submission_hours2(@submission_month).to_f
        workhours_months.push(workhours_this_month)
      end
    end

    weeks_in_period = ((date - date.months_ago(4))/7).to_i
    workhours_in_period = workhours_months.sum
    average_workhours_week = (workhours_in_period / weeks_in_period.to_i).round(2)
    puts average_workhours_week
    return average_workhours_week
  end

end
