class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :confirmed, :tenant_id, :first_name, :last_name
  belongs_to :tenant
  has_secure_password
  validates_presence_of :password, :on => :create

end
