class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :manager_id
      t.integer :deputy_id

      t.timestamps
    end
  end
end