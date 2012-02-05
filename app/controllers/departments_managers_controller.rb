class DepartmentsManagersController < ApplicationController
  # GET /departments_managers
  # GET /departments_managers.json
  def index
    @departments_managers = DepartmentsManager.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @departments_managers }
    end
  end

  # GET /departments_managers/1
  # GET /departments_managers/1.json
  def show
    @departments_manager = DepartmentsManager.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @departments_manager }
    end
  end

  # GET /departments_managers/new
  # GET /departments_managers/new.json
  def new
    load_auxiliary_data
    @departments_manager = DepartmentsManager.new
    @department_id = params[:department_id]
    @departments_manager.department_id = @department_id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @departments_manager }
    end
  end

  # GET /departments_managers/1/edit
  def edit
    load_auxiliary_data
    @departments_manager = DepartmentsManager.find(params[:id])
  end

  # POST /departments_managers
  # POST /departments_managers.json
  def create
    load_auxiliary_data
    @departments_manager = DepartmentsManager.new(params[:departments_manager])

    respond_to do |format|
      if @departments_manager.save
#        format.html { redirect_to @departments_manager, notice: 'Departments manager was successfully created.' }
#        @department = @departments_manager.department
        format.html { redirect_to @departments_manager.department, notice: 'Departments manager was successfully created.' }
        format.json { render json: @departments_manager, status: :created, location: @departments_manager }
      else
        format.html { render action: "new" }
        format.json { render json: @departments_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /departments_managers/1
  # PUT /departments_managers/1.json
  def update
    load_auxiliary_data
    @departments_manager = DepartmentsManager.find(params[:id])

    respond_to do |format|
      if @departments_manager.update_attributes(params[:departments_manager])
        format.html { redirect_to @departments_manager, notice: 'Departments manager was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @departments_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments_managers/1
  # DELETE /departments_managers/1.json
  def destroy
    @departments_manager = DepartmentsManager.find(params[:id])
    @departments_manager.destroy

    respond_to do |format|
      format.html { redirect_to departments_managers_url }
      format.json { head :ok }
    end
  end

  private

  def load_auxiliary_data
    @departments = Department.order("name ASC")
    @users = User.order("email ASC")
  end
end
