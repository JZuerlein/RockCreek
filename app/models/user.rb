class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :confirmed, :tenant_id, :first_name, :last_name, :group_ids
  belongs_to :tenant
  has_secure_password
  validates_presence_of :password, :on => :create

  has_many :user_group_assignments
  has_many :groups, through: :user_group_assignments

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def is_member_of_admin
    group_ids.include?(1)
  end

  def is_member_of(group_name)
    for group in groups
      if group.name == group_name
        true
      end
    end
    false
  end

end
