class BuyProductsController < ApplicationController
	before_action :buy_user,only:[:update]
  def update
    @buyproduct = BuyProduct.new
    @buy = Buy.find_by(user_id:params[:id])
    @buyproduct.buy_id = @buy.id
    @product = Product.find_by(user_id:params[:id])
    @buyproduct.product.id = @product.id
    @cartproduct = CartProduct.find_by()
    @buyproduct.count = 
    @buyproduct.price = 
    @buyproduct.save
# ---途中です---



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
