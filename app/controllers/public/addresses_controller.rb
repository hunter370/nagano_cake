class Public::AddressesController < ApplicationController
  
  def new
    @address = Address.new
  end
  
  def create
   @address = Address.new(address_params)
   @address.save
   redirect_to addresses_index_path
  end  
  
  def index
  end
  
  def edit
  end
  
  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
  
end
