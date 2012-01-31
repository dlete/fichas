class DepartmentsMembersController < ApplicationController
  # GET /departments_members
  # GET /departments_members.json
  def index
    @departments_members = DepartmentsMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @departments_members }
    end
  end

  # GET /departments_members/1
  # GET /departments_members/1.json
  def show
    @departments_member = DepartmentsMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @departments_member }
    end
  end

  # GET /departments_members/new
  # GET /departments_members/new.json
  def new
    load_auxiliary_data
    @departments_member = DepartmentsMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @departments_member }
    end
  end

  # GET /departments_members/1/edit
  def edit
    load_auxiliary_data
    @departments_member = DepartmentsMember.find(params[:id])
  end

  # POST /departments_members
  # POST /departments_members.json
  def create
    load_auxiliary_data
    @departments_member = DepartmentsMember.new(params[:departments_member])

    respond_to do |format|
      if @departments_member.save
        format.html { redirect_to @departments_member, notice: 'Departments member was successfully created.' }
        format.json { render json: @departments_member, status: :created, location: @departments_member }
      else
        format.html { render action: "new" }
        format.json { render json: @departments_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /departments_members/1
  # PUT /departments_members/1.json
  def update
    load_auxiliary_data
    @departments_member = DepartmentsMember.find(params[:id])

    respond_to do |format|
      if @departments_member.update_attributes(params[:departments_member])
        format.html { redirect_to @departments_member, notice: 'Departments member was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @departments_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments_members/1
  # DELETE /departments_members/1.json
  def destroy
    @departments_member = DepartmentsMember.find(params[:id])
    @departments_member.destroy

    respond_to do |format|
      format.html { redirect_to departments_members_url }
      format.json { head :ok }
    end
  end

  private

  def load_auxiliary_data
    @departments = Department.order("name ASC")
    @users = User.order("email ASC")
  end
end
