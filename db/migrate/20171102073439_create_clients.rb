class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :document
      t.string :name
      t.string :email
      t.string :city
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
  end
end
