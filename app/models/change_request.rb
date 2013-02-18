class ChangeRequest < ActiveRecord::Base
  attr_accessible :requester_id, :assigned_to, :change_type, :description, :due_date, :request_date, :status, :summary
  default_scope { where(tenant_id: Tenant.current_id)}
end
