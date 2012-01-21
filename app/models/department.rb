class Department < ActiveRecord::Base
  has_many :departments_managers
  has_many :managers, :through => :departments_managers, :source => 'user'

  has_many :departments_members
  has_many :members, :through => :departments_members, :source => 'user'
end
