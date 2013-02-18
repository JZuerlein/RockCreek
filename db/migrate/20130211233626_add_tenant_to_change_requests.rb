class AddTenantToChangeRequests < ActiveRecord::Migration
  def change
    add_column :change_requests, :tenant_id, :integer
    add_index :change_requests, :tenant_id
  end
end
