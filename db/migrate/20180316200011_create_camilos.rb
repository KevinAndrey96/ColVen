class CreateCamilos < ActiveRecord::Migration
  def change
    create_table :camilos do |t|
      t.string :name
      t.integer :age

      t.timestamps null: false
    end
  end
end
