class WorkdaysController < ApplicationController
#####################
  def popu
    @aa = params[:pppp]
    @bb = 'variable bb'
    @cc = params[:pppp] ? Date.parse(params[:pppp]) : Date.today
    @dd = Date.parse(params[:pppp])
    popu_all_month(@dd)
    redirect_to workdays_path(:month => @dd.strftime("%A, %d %B %Y"))
  end

  def wipe
    @aa = params[:pppp]
    @bb = 'variable bb'
    @cc = params[:pppp] ? Date.parse(params[:pppp]) : Date.today
    @dd = Date.parse(params[:pppp])
    wipe_all_month(@dd)
    redirect_to workdays_path(:month => @dd.strftime("%A, %d %B %Y"))
  end

def popu_all_month(dddd)
  sd = dddd.beginning_of_month
  ed = dddd.end_of_month
  sd.upto(ed) do |n|
    if (n+1).cwday <= 5
      @workday = Workday.new
      @workday.working_date = n
      @workday.working_hours = "8"
      @workday.user_id = current_user.id
      @workday.save
    end
  end
end

def wipe_all_month(dddd)
  sd = dddd.beginning_of_month
  ed = dddd.end_of_month
  @dispose_of = Workday.find(:all, :conditions => { :user_id => current_user.id, :working_date => sd.beginning_of_month..ed.end_of_month, :submission_id => nil })
  @dispose_of.each do |d|
    d.destroy
  end
end


#####################

  # GET /workdays
  # GET /workdays.json
  def index
    @workdays = Workday.all
    @workdays = current_user.workdays
    @date = params[:month] ? Date.parse(params[:month]) : Date.today  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workdays }
    end
  end

  # GET /workdays/1
  # GET /workdays/1.json
  def show
    @workday = Workday.find(params[:id])
    @dd = params[:d_gui] ? Date.parse(params[:d_gui]) : Date.today

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workday }
    end
  end

  # GET /workdays/new
  # GET /workdays/new.json
  def new
    @workday = Workday.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workday }
    end
  end

  # GET /workdays/1/edit
  def edit
    @workday = Workday.find(params[:id])
  end

  # POST /workdays
  # POST /workdays.json
  def create
    @workday = Workday.new(params[:workday])
    @workday.user_id = current_user.id

    respond_to do |format|
      if @workday.save
        format.html { redirect_to @workday, notice: 'Workday was successfully created.' }
        format.json { render json: @workday, status: :created, location: @workday }
      else
        format.html { render action: "new" }
        format.json { render json: @workday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workdays/1
  # PUT /workdays/1.json
  def update
    @workday = Workday.find(params[:id])

    respond_to do |format|
      if @workday.update_attributes(params[:workday])
        format.html { redirect_to @workday, notice: 'Workday was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @workday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workdays/1
  # DELETE /workdays/1.json
  def destroy
    @workday = Workday.find(params[:id])
    @workday.destroy

    respond_to do |format|
      format.html { redirect_to workdays_url }
      format.json { head :ok }
    end
  end

end
