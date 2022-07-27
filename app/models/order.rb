class Order
  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :post_cord, :area_id, :city, :block_number, :building, :phone_number, :user_id, :item_id, :token

  validates :post_cord, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :area_id, presence: true
  validates :city, presence: true
  validates :block_number, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :token, presence: true

  validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_cord: post_cord, area_id: area_id, city: city, block_number: block_number, building: building,
                   phone_number: phone_number, purchase_id: purchase.id)
  end
end
