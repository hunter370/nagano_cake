class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  def add_tax_price
   (self.price * 1.10).floor
  end
  
  def subtotal
      item.add_tax_price*quantity
  end
end
