class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :model, :image_url, :brand, :description, :price, :category_id
  has_many :campaigns
end
