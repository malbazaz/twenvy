class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.integer :product_id
      t.date :end_date
      t.string :location
      t.integer :target_qty
      t.integer :sold_qty

      t.timestamps
    end
  end
end
