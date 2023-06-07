class ChangingDeliveryTimeType < ActiveRecord::Migration[7.0]
  def change
    change_column :stores, :estimated_delivery_time, :string
  end
end
