class AddPurchaseOrderToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :purchaseOrder, :string
    # add_column :properties, :, :string
    add_column :properties, :string, :string
  end
end
