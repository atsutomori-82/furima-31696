class ItemOrder
  include ActiveModel::Model
  attr_accessor :post_number, :region_id, :city, :address, :building, :tel, :price


with_options presence: true do
  validates :category_id
  validates :condition_id
  validates :shipping_id
  validates :region_id
  validates :shipping_day_id
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  validates :region_id, numericality: { other_than: 0, message: "can't be blank" }
end

def save
  Address.create(post_number: post_number, region_id: region_id, city: city, address: address, building: building, tel: tel)

end