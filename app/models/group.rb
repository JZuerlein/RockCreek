class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :user_group_assignments
  has_many :users, through: :user_group_assignments
end
