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

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :region_id
    validates :shipping_day_id
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }
  end

  #validates :price, format: { with: /\d{4,7}/ } do
  #end
end
