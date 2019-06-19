class AddSpendToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :spend, :decimal, :scale => 2
  end
end
