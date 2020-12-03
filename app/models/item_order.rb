class ItemOrder
  include ActiveModel::Model
  attr_accessor :post_number, :region_id, :city, :address, :building, :tel, :price, :item_id, :user_id, :token


with_options presence: true do
  validates :token
  validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :region_id, numericality: { other_than: 1}
  validates :city
  validates :address
  validates :tel, format: {with: /\A[0-9]{,11}\z/, message: "is invalid. Only integer"}
  validates :user_id
  validates :item_id
end

def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Address.create(post_number: post_number, region_id: region_id, city: city, address: address, building: building, tel: tel, order_id: order.id)
end

end