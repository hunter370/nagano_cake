class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @cart_items = CartItem.all
    @postage = 800
    @total = 0
    @billing_amount = @postage + @total
     if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    
     elsif params[:order][:select_address] == "1"
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      
     else
     end
  end
  
  def create
  end

  def complete
  end

  def index
  end

  def show
  end
  
  def order_params
   params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end