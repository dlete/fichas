class Submission < ActiveRecord::Base
  belongs_to :submitter, :class_name => 'User'
  belongs_to :approver, :class_name => 'User'
end
