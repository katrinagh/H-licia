class ChangeWeightPriceTypeForArticles < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :weight, 'integer USING CAST(weight AS integer)'
    change_column :articles, :price, 'float USING CAST(price AS float)'
  end
end
