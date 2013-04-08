class Plan < ActiveRecord::Base
  has_many :signups
  attr_accessible :name, :num_users, :price
end
