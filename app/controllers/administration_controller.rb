class AdministrationController < ApplicationController
  def populate
    populate_all_week
    redirect_to workdays_path
  end

  def wipe
    delete_all_week
    redirect_to workdays_path
  end


def populate_all_week
  sd = Date.today.beginning_of_week
  ed = Date.today.end_of_week
  sd.upto(ed) do |n|
    puts n
    @workday = Workday.new
    @workday.working_date = n
    @workday.working_hours = "8"
    @workday.user_id = current_user.id
    @workday.save
  end
end

def delete_all_week
  sd = Date.today.beginning_of_week
  ed = Date.today.end_of_week
  @dispose_of = Workday.find(:all, :conditions => { :user_id => current_user.id, :working_date => Date.today.beginning_of_week..Date.today.end_of_week })
  @dispose_of.each do |d|
    d.destroy
  end
end

end
