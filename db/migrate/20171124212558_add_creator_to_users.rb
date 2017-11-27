class AddCreatorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :creator, :string
  end
end
