class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.string :category
      t.string :price
      t.string :weight
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
