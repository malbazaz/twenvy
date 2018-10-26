class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :end_date, :location, :target_qty, :sold_qty
  belongs_to :product
end
