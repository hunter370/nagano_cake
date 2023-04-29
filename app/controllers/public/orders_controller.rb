class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    
   
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
