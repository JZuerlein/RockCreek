class UserGroupAssignment < ActiveRecord::Base
  attr_accessible :group_id, :user_id
  belongs_to :user
  belongs_to :group

  default_scope { where(tenant_id: Tenant.current_id)}
end
