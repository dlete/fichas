class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :submitter_id
      t.integer :approver_id

      t.timestamps
    end
  end
end
