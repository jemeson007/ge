class AddContactNumberToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :contactNumber, :string
  end
end
