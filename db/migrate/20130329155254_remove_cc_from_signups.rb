class RemoveCcFromSignups < ActiveRecord::Migration
  def change
    remove_column :signups, :credit_card
    remove_column :signups, :expires_on_month
    remove_column :signups, :expires_on_year
    remove_column :signups, :billing_zip
  end
end
