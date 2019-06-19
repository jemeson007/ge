class ChangeIntegerLimitInProperties < ActiveRecord::Migration[5.2]
  def change
  	change_column :properties, :accountNumber, :integer, limit: 8
  end
end
