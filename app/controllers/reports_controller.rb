class ReportsController < ApplicationController

# http://www.citizensinformation.ie/en/employment/employment_rights_and_conditions/hours_of_work/working_week.html

  def birdseye
    @users = User.all
    @months = Date::MONTHNAMES
#    @months = Date::MONTHNAMES.compact
  end

  def my_submissions
#    @user = current_user
    @months = Date::MONTHNAMES
  end

end
