class RequestResponse < ActiveRecord::Base
  attr_accessible :response, :change_request_id, :user_id

  belongs_to :user
  belongs_to :change_request

  default_scope { where(tenant_id: Tenant.current_id)}
end
