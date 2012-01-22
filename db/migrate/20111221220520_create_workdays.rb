class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.date :working_date
      t.decimal :working_hours
      t.references :user
      t.references :submission

      t.timestamps
    end
  end
end
