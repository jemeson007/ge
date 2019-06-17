class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :place
      t.decimal :price

      t.timestamps
    end
  end
end
