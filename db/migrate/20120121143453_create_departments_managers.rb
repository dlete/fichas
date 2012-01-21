class CreateDepartmentsManagers < ActiveRecord::Migration
  def change
    create_table :departments_managers do |t|
      t.references :department
      t.references :user
      t.boolean :deputy

      t.timestamps
    end
    add_index :departments_managers, :department_id
    add_index :departments_managers, :user_id
  end
end
