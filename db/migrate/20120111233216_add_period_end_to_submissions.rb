class AddPeriodEndToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :period_end, :date
  end
end
