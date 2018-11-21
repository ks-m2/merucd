class CartsController < ApplicationController

  def index
	@cart_product =	CartProduct.all
  end

  def show
	@cart_product =	CartProduct.all
  
  end

end
