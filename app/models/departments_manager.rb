class DepartmentsManager < ActiveRecord::Base
#belongs_to :department

#  belongs_to :user
#  belongs_to :manager, :class_name => 'User', :foreign_key => 'user_id'
 belongs_to :user
belongs_to :department
end
