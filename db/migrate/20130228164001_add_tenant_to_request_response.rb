class AddTenantToRequestResponse < ActiveRecord::Migration
  def change
    add_column :request_responses, :tenant_id, :integer
    add_index :request_responses, :tenant_id
  end
end
