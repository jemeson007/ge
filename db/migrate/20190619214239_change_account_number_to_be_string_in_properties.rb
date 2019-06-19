class ChangeAccountNumberToBeStringInProperties < ActiveRecord::Migration[5.2]
  def change
  	change_column :properties, :accountNumber, :string
  end
end
