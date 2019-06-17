class AddViewToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :view, :binary
  end
end
