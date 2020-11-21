class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
   validates :name
   validates :text
   validates :category_id
   validates :condition_id
   validates :shipping_id
   validates :region_id
   validates :shipping_day_id
   validates :price
  end
end
