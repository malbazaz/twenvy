class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :model
      t.string :brand
      t.string :image_url
      t.text :description
      t.integer :price
      t.integer :category_id

      t.timestamps
    end
  end
end
