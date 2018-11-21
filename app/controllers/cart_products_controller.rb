class CartProductsController < ApplicationController
 before_action :cart_create only: [:update]

  def cart_create
  	if @cart = Cart.where(user_id: current_user.id).exists?
  	else
  	@cart = Cart.new(user_id: current_user.id)
  	@cart.save

  end

  def update
  	@cart_product = CartProduct.new(cart_set)
  	@cart_product.cart_id = current_user.id
	  @cart_product.product_id = params[:id]
  	@cart_product.save
  end


  def destroy
    @cart_product.destroy
    redirect_to update
  end

 end