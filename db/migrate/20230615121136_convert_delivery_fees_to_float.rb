class ConvertDeliveryFeesToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :stores, :delivery_fees, :float
  end
end
