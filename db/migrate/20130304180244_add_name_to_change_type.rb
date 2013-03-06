class AddNameToChangeType < ActiveRecord::Migration
  def change
    add_column :change_types, :name, :string
  end
end
