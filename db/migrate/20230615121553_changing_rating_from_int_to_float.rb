class ChangingRatingFromIntToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :stores, :rating, :float
  end
end
