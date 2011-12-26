class AddSubmissionIdToWorkdays < ActiveRecord::Migration
  def change
    add_column :workdays, :submission_id, :integer
  end
end
