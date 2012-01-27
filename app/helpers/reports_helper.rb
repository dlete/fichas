module ReportsHelper

def ah(user_id, date)
  workhours_period = 0
  0.upto(3) do |n|
    @period_begin = date.months_ago(n).beginning_of_month
    @s = Submission.find(:first, :conditions => { :submitter_id => user_id, :period_begin => @period_begin } )
    if @s.nil?
    else
    if @s.approver_id.nil?
      workhours_month = 0
    else
      workhours_month = @s.workdays.sum(:working_hours).to_i
    end
    end
    workhours_period = workhours_period.to_i + workhours_month.to_i
  end

  weeks_in_period = ((date - date.months_ago(4))/7).to_i
  average_workhours_week = workhours_period / weeks_in_period
  return average_workhours_week
end

  def submission_status(user_id, date)
    @s = Submission.find(:first, :conditions => { :submitter_id => user_id, :period_begin => date } )
    if @s.nil?
      return "Not submitted"
    elsif @s.approver_id.nil?
      return "Submitted"
    else
      return "Approved"
    end
  end

end
