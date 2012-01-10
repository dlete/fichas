class ReportsController < ApplicationController
  def birdseye
    @users = User.all
    @months = Date::MONTHNAMES
#    @months = Date::MONTHNAMES.compact
#    @months = [ "", "January", "February", "March" ]
  end

end
