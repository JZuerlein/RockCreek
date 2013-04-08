class CreateEventlogs < ActiveRecord::Migration
  def change
    create_table :eventlogs do |t|
      t.string :ip
      t.string :controller
      t.string :user
      t.string :action
      t.datetime :when

      t.timestamps
    end
  end
end
