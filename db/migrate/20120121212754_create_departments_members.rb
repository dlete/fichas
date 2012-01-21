class CreateDepartmentsMembers < ActiveRecord::Migration
  def change
    create_table :departments_members do |t|
      t.references :department
      t.references :user
      t.boolean :administrative_department, :default => true

      t.timestamps
    end
    add_index :departments_members, :department_id
    add_index :departments_members, :user_id
  end
end
