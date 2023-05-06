class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @total = 0
    @postage = 800
    @billing_amount = @postage + @total
  end
end
