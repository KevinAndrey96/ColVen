class AddWholesalerToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :wholesaler, :string
  end
end
