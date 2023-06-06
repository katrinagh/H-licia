class ChangeAttributeToOrders < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :cart, :confirmed
    change_column_null :orders, :confirmed, false
  end
end
