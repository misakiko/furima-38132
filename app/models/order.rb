class Order
  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :post_cord, :area_id, :city, :block_number, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :block_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_cord: post_cord, area_id: area_id, city: city, block_number: block_number, building: building,
                   phone_number: phone_number, purchase_id: purchase.id)
  end
end