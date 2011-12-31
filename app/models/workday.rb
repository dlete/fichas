class Workday < ActiveRecord::Base
  belongs_to :user
  belongs_to :submission

  validates :working_date, :uniqueness => { :scope => :user_id, :message => "only one workday per day per person" }
end
