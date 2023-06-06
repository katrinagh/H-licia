class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.integer :rating
      t.time :estimated_delivery_time
      t.integer :delivery_fees

      t.timestamps
    end
  end
end
