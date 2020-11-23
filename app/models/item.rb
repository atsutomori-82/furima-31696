class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
           
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :region, :shipping, :shipping_day
  validates :category, numericality: { other_than: 1 }
  validates :condition, numericality: { other_than: 1 }
  validates :shipping, numericality: { other_than: 1 }
  validates :region, numericality: { other_than: 1 }
  validates :shipping_day, numericality: { other_than: 1 }

  with_options presence: true do
   validates :name
   validates :text
   validates :category_id
   validates :condition_id
   validates :shipping_id
   validates :region_id
   validates :shipping_day_id
  end

   validates :price, format: { with: /\d{4,7}/ } do
  end
end
