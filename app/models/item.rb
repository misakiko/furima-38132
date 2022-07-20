class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :situation
  belongs_to_active_hash :price_bear
  belongs_to_active_hash :area
  belongs_to_active_hash :days

  belongs_to :user
  # has_one :purchase
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true
  validates :messages, presence: true
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price_bear_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :days_id, numericality: { other_than: 1, message: "can't be blank" }
end
