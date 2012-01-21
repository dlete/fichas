class DepartmentsManager < ActiveRecord::Base
#  with this you would reference users with the method "manager" (i.e. DepartmentsManager.first.manager)
#  belongs_to :manager, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :user
  belongs_to :department
end
