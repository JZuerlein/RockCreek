class AddChangeRequestToRequestResponse < ActiveRecord::Migration
  def change
    add_column :request_responses, :change_request_id, :integer
    add_index :request_responses, :change_request_id
  end
end
