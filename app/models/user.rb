class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :confirmed, :tenant_id, :first_name, :last_name
  belongs_to :tenant
  has_secure_password
  validates_presence_of :password, :on => :create

  has_many :user_group_assignments
  has_many :groups, through: :user_group_assignments

  def full_name
    [first_name, last_name].compact.join(' ')
  end

end
