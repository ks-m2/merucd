class CartsController < ApplicationController

	before_action :authenticate_user! ,only: [:show]

  def index
  	@cart_products = CartProduct.all
    @total_price = 0
    @cart_products.each do |cartproduct|
      @total_price += cartproduct.product.price
      #---合計金額---http://rails.takayukikoyama.com/model%E9%96%A2%E9%80%A3/model-sum-total-price/---#

    end

  end

  def show
  	@user = User.find(params[:id])
  	@product = Product.find(params[:id])
  	@delivery = Delivery.new
    @cartproducts = CartProduct.all
    @buyproduct = BuyProduct.new
   #  @a = Cart.find_by(user_id: params[:id])
   #  @b = Product.find_by(user_id: @a.id)
  	# @cartproducts = CartProduct.where(cart_id: @b.id)

  end


end
