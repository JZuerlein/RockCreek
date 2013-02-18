class CreateChangeRequests < ActiveRecord::Migration
  def change
    create_table :change_requests do |t|
      t.integer :requester_id
      t.date :request_date
      t.string :status
      t.string :summary
      t.string :description
      t.string :change_type
      t.integer :assigned_to
      t.date :due_date

      t.timestamps
    end
  end
end
