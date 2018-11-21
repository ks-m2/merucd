class CartProductsController < ApplicationController
  def create
  	
  end

  def update
  	@cartpro = CartProduct.new(aaa)
  	@cartpro.product_id = params[:id]

  	@cart = Cart.find_by(user_id: current_user.id)

  	@cartpro.cart_id = @cart.id
  	@cartpro.save
  end

  def destroy
    
  end
  private
  def aaa
  	params.require(:cart_product).permit(:count)
  end
end

