class AddCheeseIdToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :cheese_id, :integer
  end
end
