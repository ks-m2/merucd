class CartsController < ApplicationController

	before_action :authenticate_user! ,only: [:show]
  before_action :cart_create, only: [:index]

  def cart_create
    if @cart = Cart.where(user_id: current_user.id).exists?
    else
    @cart = Cart.new(user_id: current_user.id)
    @cart.save

  end

  end

  def index
    @a = Cart.find_by(user_id: current_user)
    @cart_products = CartProduct.where(cart_id: @a.id)

    @total_price = 0
    @total_count = 0
    @cart_products.each do |cartproduct|
      @total_price += cartproduct.product.price * cartproduct.count #---合計金額---#

      @total_count += cartproduct.count #---合計個数---#
    end
  end

  def show
    @a = Cart.find_by(user_id: current_user)
    @cartproducts = CartProduct.where(cart_id: @a.id)
  	# @product = Product.find(params[:id])
  	# @delivery = Delivery.new
    @buyproduct = BuyProduct.new

    @total_price = 0
    @cartproducts.each do |cartproduct|
      @total_price += cartproduct.product.price * cartproduct.count #---合計金額---#
    end

  end


end
