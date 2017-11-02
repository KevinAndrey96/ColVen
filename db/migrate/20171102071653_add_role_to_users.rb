class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, default: "Commerce"
  end
end
