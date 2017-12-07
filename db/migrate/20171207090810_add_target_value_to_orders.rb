class AddTargetValueToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :target_value, :string
  end
end
