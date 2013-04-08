class AddStripeIdToSignups < ActiveRecord::Migration
  def change
    add_column :signups, :stripe_id, :int
  end
end
