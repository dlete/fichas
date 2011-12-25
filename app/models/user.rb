class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create

  has_many :workdays
  has_many :manager, :class_name => 'Department', :foreign_key => 'manager_id'
  has_many :deputy, :class_name => 'Department', :foreign_key => 'deputy_id'
end
