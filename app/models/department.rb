class Department < ActiveRecord::Base
  has_many :users

  has_many :departments_managers
  has_many :managers, :through => :departments_managers, :source => 'user'
end
