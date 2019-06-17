class AddPersonIdToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :person_id, :integer
  end
end
