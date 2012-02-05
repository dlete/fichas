class AddSubmittedAtToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :submitted_at, :date
    add_column :submissions, :approved_at, :date
  end
end
