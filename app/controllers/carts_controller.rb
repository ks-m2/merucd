class CartsController < ApplicationController

	before_action :authenticate_user! ,only: [:show]

  def index
	@cart_products =	CartProduct.all
  end

  def show
  	@user = User.find(params[:id])
  	@product = Product.find(params[:id])
  	@delivery = Delivery.new

    @a = Cart.find_by(user_id: params[:id])
    @b = Product.find_by(user_id: @a.id)
  	@cartproducts = CartProduct.where(cart_id: @b.id)

  end

end
