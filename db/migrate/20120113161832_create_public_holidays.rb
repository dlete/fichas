class CreatePublicHolidays < ActiveRecord::Migration
  def change
    create_table :public_holidays do |t|
      t.date :day
      t.string :event

      t.timestamps
    end
  end
end
