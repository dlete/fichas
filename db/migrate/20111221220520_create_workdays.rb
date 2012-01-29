class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.date :working_date
      t.decimal :working_hours, :precision => 4, :scale => 2
      t.references :user
      t.references :submission

      t.timestamps
    end
  end
end

# precision and scale
# http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/TableDefinition.html
