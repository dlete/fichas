module SubmissionsHelper

  def workhours_in_submission(submission)
    Submission.find(submission).workdays.sum(:working_hours)
  end

end
