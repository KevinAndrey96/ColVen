class AddTypeAccountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :type_account, :string
  end
end
