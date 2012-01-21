class RemoveDeputyIdFromDepartments < ActiveRecord::Migration
  def up
    remove_column :departments, :deputy_id
  end

  def down
    add_column :departments, :deputy_id, :integer
  end
end
