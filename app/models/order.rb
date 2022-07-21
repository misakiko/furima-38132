class Order
  include ActiveModel::Model
  attr_accessor :post_cord, :area_id, :city, :block_number, :building, :phone_number, :number, :cvc, :exp_month, :exp_year

# addressのバリデーション
  VALID_POSTAL_CODE_REGEX = /^[0-9]{3}-[0-9]{4}$/
  validates :post_cord, presence: true, format: {with: VALID_POSTAL_CODE_REGEX }
  validates :area_id, presence: true
  validates :city, presence: true
  validates :block_number, presence: true
  # (validates :building 空でもいいからいらないかも)
  VALID_PHONE_NUMBER_REGEX = /^\d{10,11}$/
  validates :phone_number, presence: true, format: {with: VALID_PHONE_NUMBER_REGEX }
#  クレカのバリデーション必要？

def save
  order = Purchase.create(user_id: user_id, item_id: item_id)
  Address.create(post_cord: post_cord, area_id: area_id, city: city, block_number: block_number, building: building, phone_number: phone_number, order_id: order.id)
end
 
 