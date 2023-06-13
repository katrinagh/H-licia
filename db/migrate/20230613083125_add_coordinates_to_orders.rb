class AddCoordinatesToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :latitude, :float, default: 46.517983
    add_column :orders, :longitude, :float, default: 6.632351
  end
end
