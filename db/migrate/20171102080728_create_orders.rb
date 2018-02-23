class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :client, index: true, foreign_key: true
      t.integer :value
      #t.integer :target_value
      t.string :document
      t.string :name
      t.string :email
      t.string :phone
      t.string :account
      t.string :zone
      t.string :status, default: "Espera"
      t.string :voucher
      t.string :commerce
      t.string :distributor
      
      t.timestamps null: false
    end
  end
end
