class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
           
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition 
  belongs_to :region
  belongs_to :shipping
  belongs_to :shipping_day


  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
  validates :region_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
  

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

   validates :price, format: { with: /\d{4,7}/ } do
  end
end
