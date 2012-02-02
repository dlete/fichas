class WorkdaysController < ApplicationController

  def populate
    @date = Date.parse(params[:date_in_gui])
    populate_range_of_dates(@date.beginning_of_month, @date.end_of_month)
    redirect_to workdays_path(:date_in_gui => @date.strftime("%Y-%m-01"))
  end

  def wipe
    @date = Date.parse(params[:date_in_gui])
    wipe_range_of_dates(@date.beginning_of_month, @date.end_of_month)
    redirect_to workdays_path(:date_in_gui => @date.strftime("%Y-%m-01"))
  end

  def populate_range_of_dates(date_beginning, date_end)
    date_beginning.upto(date_end) do |n|
      if (n).cwday <= 5
        if PublicHoliday.find_by_day(n).nil?
          @workday = Workday.new
          @workday.working_date = n
          @workday.working_hours = "7.5"
          @workday.user_id = current_user.id
          @workday.save
        end
      end
    end
  end

  def wipe_range_of_dates(date_beginning, date_end)
    @dispose_of = Workday.find(:all, 
                               :conditions => { :user_id => current_user.id, 
                                                :working_date => date_beginning..date_end, 
                                                :submission_id => nil 
                                              }
                              )
    @dispose_of.each do |d|
      d.destroy
    end
  end

  # GET /workdays
  # GET /workdays.json
  def index
#    @workdays = Workday.all
#    @workdays = current_user.workdays
    @date = params[:date_in_gui] ? Date.parse(params[:date_in_gui]) : Date.today  
    @workdays = Workday.find(:all, :conditions => { :user_id => current_user.id, :working_date => @date.beginning_of_month..@date.end_of_month })
    @workhours_month = @workdays.sum(&:working_hours)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workdays }
    end
  end

  # GET /workdays/1
  # GET /workdays/1.json
  def show
    @workday = Workday.find(params[:id])
#    @dd = params[:d_gui] ? Date.parse(params[:d_gui]) : Date.today

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
        format.html { redirect_to workdays_path(:date_in_gui => @workday.working_date.strftime("%Y-%m-01")) }
        format.json { render json: @workday, status: :created, location: @workday }
      else
        format.html { render action: "new" }
        format.json { render json: @workday.errors, status: :unprocessable_entity }
      end
    end

#    respond_to do |format|
#      if @workday.save
#        format.html { redirect_to @workday, notice: 'Workday was successfully created.' }
#        format.json { render json: @workday, status: :created, location: @workday }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @workday.errors, status: :unprocessable_entity }
#      end
#    end
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

#    respond_to do |format|
#      if @workday.update_attributes(params[:workday])
#        format.html { redirect_to workdays_path(:date_in_gui => @workday.working_date.strftime("%Y-%m-01")) }
#        format.json { head :ok }
#      else
#        format.html { render action: "edit" }
#        format.json { render json: @workday.errors, status: :unprocessable_entity }
#      end
#    end

#    respond_to do |format|
#      if @workday.update_attributes(params[:workday])
#        format.html { redirect_to @workday, notice: 'Workday was successfully updated.' }
#        format.json { head :ok }
#      else
#        format.html { render action: "edit" }
#        format.json { render json: @workday.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # DELETE /workdays/1
  # DELETE /workdays/1.json
  def destroy
    @workday = Workday.find(params[:id])
    @date_in_gui = @workday.working_date
    @workday.destroy

    respond_to do |format|
      format.html { redirect_to workdays_url(:date_in_gui => @date_in_gui.strftime("%Y-%m-01")) }
      format.json { head :ok }
    end

#    respond_to do |format|
#      format.html { redirect_to workdays_url }
#      format.json { head :ok }
#    end
  end

end
