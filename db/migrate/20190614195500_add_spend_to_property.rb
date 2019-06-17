class AddSpendToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :spend, :decimal
  end
end
