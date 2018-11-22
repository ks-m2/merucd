class CartsController < ApplicationController

	before_action :authenticate_user! ,only: [:show]

  def index
	@cart_products =	CartProduct.all
  end

  def show
    
  	@user = User.find(params[:id])
  	@product = Product.find(params[:id])
  	@delivery = Delivery.find(params[:id])
  	@cartproducts = CartProduct.where(cart_id: params[:id])
  end

end
