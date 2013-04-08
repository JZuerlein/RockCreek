class Changestripetokendatatypeinsignups < ActiveRecord::Migration
  def change
    change_column :signups, :stripe_token, :string
  end
end
