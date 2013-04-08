class AddLastFourDigitsToSignups < ActiveRecord::Migration
  def change
    add_column :signups, :last_four_digits, :int
  end
end
