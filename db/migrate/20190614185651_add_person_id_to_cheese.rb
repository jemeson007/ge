class AddPersonIdToCheese < ActiveRecord::Migration[5.2]
  def change
    add_column :cheeses, :person_id, :integer
  end
end
