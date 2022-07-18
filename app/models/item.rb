class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  validates :item_name, presences: true
  validates :messages, presences: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
end                  
  
