## Heroku ##
heroku create --stack cedar
Creating floating-mist-3085... done, stack is cedar
http://floating-mist-3085.herokuapp.com/ | git@heroku.com:floating-mist-3085.git

renamed to fichas
http://fichas.herokuapp.com/ | `git@heroku.com:fichas.git`

## scrap
@my = Date.today.year.to_s + "-" + "January"
@dd = Date.parse(@my).end_of_month
Submission.find(:all, :conditions => { :submitter_id => 5, :period_end => @dd } )

## To do ##
* ~~only one workday per day~~
* ~~do not populate, automatically, the weekends~~
* ~~allow to wipe, only if it has not been approved, if the submission_id is empty~~
* ability to delete individual days
* workday, when editing, once edited redirect to index
* single sign on, shibboleth?, pubcookie?
* do not populate, automatically, bank holidays
* once a workday is submitted, do not allow to resubmit
* db schema for user/department/manager
* once populated, redirect to the month you were in the calendar, for all in one go
* once populated, redirect to the month you were in the calendar, for one by one workday
* show status of a submission pending/rejected
* send mail when submitting to approver
* send mail when approving to submitter
* lighten up javascript files in application
* reports, what submissions have been submitted, state, pending approval, approved, for user and approver
* in submissions listing for approver, order users alphabetically
* when showing submissions for approval to the approver, take to the month corresponding to that submission (now it takes you to the current month)
* to approve submissions, take to the `show` action instead of `edit`
* when not approving a submission, allow the approver to write a note, and the submitter to read that note (and send an email?)
