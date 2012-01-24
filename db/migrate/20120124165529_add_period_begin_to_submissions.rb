class AddPeriodBeginToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :period_begin, :date
  end
end
