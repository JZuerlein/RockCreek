class CreateInviteUsers < ActiveRecord::Migration
  def change
    create_table :invite_users do |t|
      t.string :subdomain
      t.string :email
      t.string :email_invitation_token
      t.date :email_invitation_sent_at

      t.timestamps
    end
  end
end
