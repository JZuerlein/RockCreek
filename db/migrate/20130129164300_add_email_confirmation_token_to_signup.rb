class AddEmailConfirmationTokenToSignup < ActiveRecord::Migration
  def change
    add_column :signups, :email_confirmation_token, :string
    add_column :signups, :email_confirmation_sent_at, :datetime
  end
end
