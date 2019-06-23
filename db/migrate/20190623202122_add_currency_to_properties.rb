class AddCurrencyToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :currency, :string
  end
end
