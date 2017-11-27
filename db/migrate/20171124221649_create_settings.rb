class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.float :exchange_rate

      t.timestamps null: false
    end
  end
end
