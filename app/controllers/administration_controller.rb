class AdministrationController < ApplicationController
  def populate
    populate_all_month
    redirect_to workdays_path
  end

  def wipe
    delete_all_month
    redirect_to workdays_path
  end

def populate_all_month
  sd = Date.today.beginning_of_month
  ed = Date.today.end_of_month
  sd.upto(ed) do |n|
    puts n
    @workday = Workday.new
    @workday.working_date = n
    @workday.working_hours = "8"
    @workday.user_id = current_user.id
    @workday.save
  end
end


def delete_all_month
  sd = Date.today.beginning_of_month
  ed = Date.today.end_of_month
  @dispose_of = Workday.find(:all, :conditions => { :user_id => current_user.id, :working_date => Date.today.beginning_of_month..Date.today.end_of_month })
  @dispose_of.each do |d|
    d.destroy
  end
end

end
