class AddTenantToInviteUsers < ActiveRecord::Migration
  def change
    add_column :invite_users, :tenant_id, :integer
    add_index :invite_users, :tenant_id
  end
end
