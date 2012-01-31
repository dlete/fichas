class DepartmentsMember < ActiveRecord::Base
  belongs_to :department
  belongs_to :user

  # to avoid errors in validation
  # http://stackoverflow.com/questions/1793595/rails-validation-error-with-select-tags
  # user can only be once in a department
  validates :department_id, :uniqueness => { :scope => :user_id, :message => "staff can only belong to a department once" }
  # user can only have one administrative_department
  validates :user_id, :uniqueness => { :scope => :administrative_department, :message => "staff can only have one administrative department" }

end
