class AddUserToRequestResponse < ActiveRecord::Migration
  def change
    add_column :request_responses, :user_id, :integer
    add_index :request_responses, :user_id
  end
end
