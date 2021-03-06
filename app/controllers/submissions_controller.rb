class SubmissionsController < ApplicationController

  def submit_for_approval
    set_submitter
    redirect_to workdays_path
  end

  def set_submitter_in_date_range(date_beginning, date_end)
    @workdays_to_set_submitter = Workday.find(:all, :conditions => { :user_id => current_user.id, :working_date => date_beginning..date_end })
    for d in @workdays_to_set_submitter
      d.submission_id = User.find(current_user.id).submissions.last.id
      d.save
    end
  end

  def unset_submitter(submission)
    @workdays_to_unset_submitter = submission.workdays
    for d in @workdays_to_unset_submitter
      d.submission_id = nil
      d.save
    end
  end


  # GET /submissions
  # GET /submissions.json
  def index
    @user_administrative_manager = user_administrative_manager(current_user)
    @departments_managed_by_user = current_user.departments_managed
    @submissions = Submission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @submissions }
    end
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    @submission = Submission.find(params[:id])
    @workdays = @submission.submitter.workdays
#    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    @date = @submission.period_begin

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @submission }
    end
  end

  # GET /submissions/new
  # GET /submissions/new.json
  def new
    load_auxiliary_data
    @date = params[:date_in_gui] ? Date.parse(params[:date_in_gui]) : Date.today

    @submission = Submission.new
    @submission.submitter_id = current_user.id
    @submission.submitted_at = Date.today
    @submission.period_begin = @date.beginning_of_month
    @submission.period_end = @date.end_of_month
    @submission.save
    set_submitter_in_date_range(@date.beginning_of_month, @date.end_of_month)
# uncomment to send emails
#    MailSubmissions.notify_submission_new(current_user).deliver
    redirect_to workdays_path(:date_in_gui => @date.strftime("%Y-%m-01"))
  end

  # GET /submissions/1/edit
  def edit
    load_auxiliary_data
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    @submission = Submission.find(params[:id])
    @workdays = @submission.submitter.workdays
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @date = params[:date_in_gui] ? Date.parse(params[:date_in_gui]) : Date.today
    @submission = Submission.new
    @submission.submitter_id = current_user.id
    @submission.submitted_at = Date.today
    @submission.period_begin = @date.beginning_of_month
    @submission.period_end = @date.end_of_month
    @submission.save
    set_submitter_in_date_range(@date.beginning_of_month, @date.end_of_month)
# uncomment to send emails
#    MailSubmissions.notify_submission_new(current_user).deliver
    redirect_to workdays_path(:date_in_gui => @date.strftime("%Y-%m-01"))

# original
#    @submission = Submission.new(params[:submission])
#
#    respond_to do |format|
#      if @submission.save
#        format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
#        format.json { render json: @submission, status: :created, location: @submission }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @submission.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PUT /submissions/1
  # PUT /submissions/1.json
  def update
    @submission = Submission.find(params[:id])
    @submission.approver_id = current_user.id
    @submission.approved_at = Date.today
    @submission.save
    redirect_to submissions_path

#    respond_to do |format|
#      if @submission.update_attributes(params[:submission])
#        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
#        format.json { head :ok }
#      else
#        format.html { render action: "edit" }
#        format.json { render json: @submission.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission = Submission.find(params[:id])
    unset_submitter(@submission)
    @submission.destroy
    redirect_to submissions_path

#    respond_to do |format|
#      format.html { redirect_to submissions_url }
#      format.json { head :ok }
#    end
  end

# who is the manager of a user?
def user_administrative_department(user)
  # which is the administrative department of a given user
  user.departments_members(:conditions => {:administrative_department => true}).first.department
end

def department_manager(department)
  # who is the official manager of a given department
  DepartmentsManager.joins(:department).where(:department_id => department, :deputy => false).first.user
end

def user_administrative_manager(user)
  # which is the administrative department of this user?
  @ad = user_administrative_department(user)
  # who is the manager of that department?
  @dm = DepartmentsManager.joins(:department).where(:department_id => @ad, :deputy => false).first.user
end
# -----------------------------

  private

  def load_auxiliary_data
    @users = User.order("email ASC")
  end

end
