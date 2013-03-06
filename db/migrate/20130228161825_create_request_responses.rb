class CreateRequestResponses < ActiveRecord::Migration
  def change
    create_table :request_responses do |t|
      t.string :response

      t.timestamps
    end
  end
end
