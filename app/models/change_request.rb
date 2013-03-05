class ChangeRequest < ActiveRecord::Base
  attr_accessible :requester_id, :assigned_to, :change_type, :description, :due_date, :request_date, :status, :summary
  default_scope { where(tenant_id: Tenant.current_id)}

  has_many :request_responses

  def requester_name
    User.find(requester_id).full_name
  end

  def assigned_to_name
    User.find(assigned_to).full_name
  end
end
