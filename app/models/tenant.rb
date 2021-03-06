class Tenant < ActiveRecord::Base
  attr_accessible :name, :subdomain, :stripe_customer_id, :case_sensitive => false
  cattr_accessor :current_id

  def self.current_id=(id)
    Thread.current[:tenant_id] = id
  end

  def self.current_id
    Thread.current[:tenant_id]
  end
end
