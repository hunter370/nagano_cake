class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 def add_tax_price
   (self.price * 1.10).floor
 end
  
 def subtotal
      item.add_tax_price*amount
 end
end
