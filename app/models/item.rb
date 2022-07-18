class Item < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :situation
  belongs_to_active_hash :price_bear
  belongs_to_active_hash :area
  belongs_to_active_hash :days

  belongs_to :user
  has_one :purchase

  validates :item_name, presences: true
  validates :messages, presences: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
end                  
  
