class AddplanIdToSignups < ActiveRecord::Migration
  def change
    add_column :signups, :plan_id, :int
  end
end
