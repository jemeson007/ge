class AddPropertyIdToCheese < ActiveRecord::Migration[5.2]
  def change
    add_column :cheeses, :property_id, :integer
  end
end
