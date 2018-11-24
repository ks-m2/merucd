class BuyProductsController < ApplicationController
	before_action :buy_user,only:[:update]
  def update

    @buyproduct = BuyProduct.new
    @cart = Cart.find_by(user_id:params[:id])
    @cartproducts = CartProduct.where(cart_id: @cart.id)
    @buy = Buy.find_by(user_id:params[:id])

    @cartproducts.each do |cartprodut|
      @buyproduct.product_id = cartproduct.product_id


      @buyproduct.buy_id = @buy.id

      @buyproduct.count = cartproduct.count

      if cartproduct.product.new_price == nil
        @buyproduct.price = cartproduct.product.price
      else
        @buyproduct.price = cartroduct.product.new_price
      end
      @buyproduct.save


      @cartproducts.destroy
      redirect_to products_path
  end

  def destroy
  end
  private
  	def buy_user
		if Buy.where(user_id: current_user.id).exists?
		else
			@buy = Buy.new(user_id: current_user.id)
			@buy.save
		end
	end
end
