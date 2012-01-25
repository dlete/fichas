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
* ~~ability to delete individual days~~
* workday.working_hours can only have two decimals
* workday index, click on hours takes directly to edit workday
* workday, when editing, once edited redirect to index
* new workday, when accepted goes to index, not to show that individual day
* single sign on, shibboleth?, pubcookie?
* user can be in more than one department
* user can only be once in a department
* user can be manager of more than one department
* user can only be once manager of a given department
* ~~do not populate, automatically, bank holidays~~
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
* ~~manager has link to submissions~~
* submitter sees state of his/her own submissions
* manager sees state of his/her and his/her group(s)
* in submission acceptance/reject, once manager does either the browser returns to the month accepted/rejected
* once staff submits, manager receives email, staff cc
* once manager approves/rejects, staff receives email, manager cc
* ability to send emails reminding from reports birdseed
* report with legal requirement (last four months/weeks average of x hours?)
* warning to admin once someone is above threshold in compliance
* manager has ability to send mail to staff reminding to submit
* staff has ability to send remainder to manager to approve/reject
* record reminders
* graph with hours per month (individual/group/all)
* with java? before submitting, ability to easily delete individual workdays. hover and x appear that if clicked then deletes?
* before submitting, ability to edit insitu
