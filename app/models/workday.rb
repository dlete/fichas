class Workday < ActiveRecord::Base
  belongs_to :user
  belongs_to :submission

  validates :working_date, :uniqueness => { :scope => :user_id, :message => "only one workday per day per person" }
  validates :working_hours, :numericality => { :less_than_or_equal_to => 24 }
end
