class FixColumnNameinsignup < ActiveRecord::Migration
  def change
    rename_column :signups, :stripe_id, :stripe_token
  end
end
