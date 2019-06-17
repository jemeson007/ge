class AddPictToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :pict, :string
  end
end
