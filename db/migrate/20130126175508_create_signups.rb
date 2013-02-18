class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.string :password_hash
      t.string :password_salt
      t.string :site_address
      t.string :credit_card
      t.integer :expires_on_month
      t.integer :expires_on_year
      t.integer :billing_zip

      t.timestamps
    end
  end
end
