class AddNameToInviteUser < ActiveRecord::Migration
  def change
    add_column :invite_users, :first_name, :string
    add_column :invite_users, :last_name, :string
    add_column :invite_users, :password, :string
    add_column :invite_users, :password_confirmation, :string
  end
end
