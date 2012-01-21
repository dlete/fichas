class User < ActiveRecord::Base
  attr_accessible :email, :department_id, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create

  has_many :workdays

  has_many :submissions, :class_name => 'Submission', :foreign_key => 'submitter_id'
  has_many :approvals, :class_name => 'Submission', :foreign_key => 'approver_id'

  has_many :departments_managers
  has_many :departments_managed, :through => :departments_managers, :source => 'department'

  has_many :departments_members
  has_many :departments, :through => :departments_members
end
