class DepartmentsManager < ActiveRecord::Base
#  with this you would reference users with the method "manager" (i.e. DepartmentsManager.first.manager)
#  belongs_to :manager, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :user
  belongs_to :department

  # user can only manager of a given department once
  validates :department_id, :uniqueness => { :scope => :user_id, :message => "staff can only be manager of a given department once" }
  # user can only have one administrative_department
  validates :department_id, :uniqueness => { :scope => :deputy, :message => "a department can only have one designated and deputy manager" }

end
