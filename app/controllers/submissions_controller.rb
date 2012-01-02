class SubmissionsController < ApplicationController

def submit_for_approval
  set_submitter
  redirect_to workdays_path
end

def set_submitter
  sd = Date.today.beginning_of_month
  ed = Date.today.end_of_month
  @workdays_to_set_submitter = Workday.find(:all, :conditions => { :user_id => current_user.id, :working_date => Date.today.beginning_of_month..Date.today.end_of_month })
  for d in @workdays_to_set_submitter
    d.submission_id = User.find(current_user.id).submissions.last.id
    d.save 
  end
end

def set_submitter2(date)
  sd = date.beginning_of_month
  ed = date.end_of_month
  @workdays_to_set_submitter = Workday.find(:all, :conditions => { :user_id => current_user.id, :working_date => sd.beginning_of_month..ed.end_of_month })
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
    @departments_managed_by_user = current_user.manager
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
@date = params[:month] ? Date.parse(params[:month]) : Date.today

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @submission }
    end
  end

  # GET /submissions/new
  # GET /submissions/new.json
  def new
    load_auxiliary_data
    @submission = Submission.new

# dlete
@dd = params[:pppp] ? Date.parse(params[:pppp]) : Date.today
@submission.submitter_id = current_user.id
@submission.save
set_submitter2(@dd)
redirect_to workdays_path
# dlete

#    respond_to do |format|
#      format.html # new.html.erb
#      format.json { render json: @submission }
#    end
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
    @submission = Submission.new(params[:submission])

    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
        format.json { render json: @submission, status: :created, location: @submission }
      else
        format.html { render action: "new" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /submissions/1
  # PUT /submissions/1.json
  def update
    @submission = Submission.find(params[:id])
    @submission.approver_id = current_user.id

    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission = Submission.find(params[:id])
    unset_submitter(@submission)
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :ok }
    end
  end

  private

  def load_auxiliary_data
    @users = User.order("email ASC")
  end

end
