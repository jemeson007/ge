class AddAccountNumberToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :accountNumber, :integer
  end
end
