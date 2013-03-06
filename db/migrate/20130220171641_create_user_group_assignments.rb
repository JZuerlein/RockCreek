class CreateUserGroupAssignments < ActiveRecord::Migration
  def change
    create_table :user_group_assignments do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
