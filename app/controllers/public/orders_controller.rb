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
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @order.postage = 800
      if @order.save
          cart_items = current_customer.cart_items.all
           cart_items.each do |cart|
               order_detail = OrderDetail.new
               order_detail.item_id = cart.item_id
               order_detail.order_id = @order.id
               order_detail.quantity = cart.amount
               order_detail.price = cart.item.price
               order_detail.save
           end
       redirect_to orders_complete_path
       cart_items.destroy_all
      else
       @order = Order.new(order.params)
       render :new
      end
  end

  def complete
  end

  def index
    @orders = current_customer.orders.includes(:order_details, :items)
  end

  def show
    # @order = current_customer.orders.find(params[:id])
  end

  def order_params
   params.require(:order).permit(:payment_method,:postal_code,:address,:name, :customer_id,:postage,:billing_amount)
  end
end
