class ChangeCoordinatesToFlats < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :latitude, :float, default: 46.525021
    change_column :users, :longitude, :float, default: 6.575380
  end
end
