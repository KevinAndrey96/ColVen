class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :client, index: true, foreign_key: true
      t.integer :value
      t.string :document
      t.string :name
      t.string :email
      t.string :city
      t.string :address
      t.string :phone
      t.string :account

      t.timestamps null: false
    end
  end
end
