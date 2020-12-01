class ItemOrder
  include ActiveModel::Model
  attr_accessor :post_number, :region_id, :city, :address, :building, :tel, :price


with_options presence: true do
  validates :category_id
  validates :condition_id
  validates :shipping_id
  validates :region_id
  validates :shipping_day_id
  validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :region_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :tel, format: {with: /\A[0-9]{,11}\z/, message: "is invalid. Only integer"}
end

def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Address.create(post_number: post_number, region_id: region_id, city: city, address: address, building: building, tel: tel)
end

end