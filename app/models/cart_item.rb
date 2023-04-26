class CartItem < ApplicationRecord
  has_one_attached :image
  belongs_to :item
  belongs_to :customer
  
  def add_tax_price
   (self.price * 1.10).floor
  end
  
  def subtotal
      item.add_tax_price*amount
  end
end
