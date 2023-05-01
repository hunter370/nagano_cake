class Order < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details
  
  enum payment_method: { credit_card: 0, transfer: 1 }
end
