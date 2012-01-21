class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.date :working_date
      t.decimal :working_hours
      t.user_id :integer
      t.submission_id :integer

      t.timestamps
    end
  end
end
