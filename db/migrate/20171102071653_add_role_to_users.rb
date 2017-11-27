class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :name, :string
    add_column :users, :zone, :string
    add_column :users, :commission, :float, default: 0.0
  end
end