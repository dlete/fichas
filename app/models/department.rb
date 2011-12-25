class Department < ActiveRecord::Base
  belongs_to :manager, :class_name => 'User'
  belongs_to :deputy, :class_name => 'User'
end
