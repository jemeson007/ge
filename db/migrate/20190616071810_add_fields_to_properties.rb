class AddFieldsToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :visual, :string
    add_column :properties, :piece, :string
  end
end
