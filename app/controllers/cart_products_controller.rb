class CartProductsController < ApplicationController

 before_action :cart_create, only: [:update]

  def cart_create
  	if @cart = Cart.where(user_id: current_user.id).exists?
  	else
  	@cart = Cart.new(user_id: current_user.id)
  	@cart.save

  end

  end

  def update


  	@cart_product = CartProduct.new(cart_params)
    @cart = Cart.find_by(user_id: current_user.id)
  	@cart_product.cart_id = @cart.id
	  @cart_product.product_id = params[:id]
  	if @cart_product.save
      redirect_to products_path
    else 
      @cart_product.errors.full_messages
      @product = Product.find(params[:id])
      @product_comment = ProductComment.new
      render "products/show"
    end

  end


  def destroy

    cart_product =  CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to update
  end

  private
  def cart_params
    params.require(:cart_product).permit(:count)
  end

 


 end


