class AddTenantToUserGroupAssignments < ActiveRecord::Migration
  def change
    add_column :user_group_assignments, :tenant_id, :integer
    add_index :user_group_assignments, :tenant_id
  end
end
