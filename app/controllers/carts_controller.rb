class CartsController < ApplicationController
  def index
  end

  def show
  	@cart = Cart.find(params[:id])
  	@user = User.find(params[:id])
  	@delivery = Delivery.find(params[:id])
  end

end
