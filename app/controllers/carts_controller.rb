class CartsController < ApplicationController

  def index
	@cart_product =	CartProduct.all
  end

  def show

  	@cart = Cart.find(params[:id])
  	@user = User.find(params[:id])
  	@delivery = Delivery.find(params[:id])
  end

end
