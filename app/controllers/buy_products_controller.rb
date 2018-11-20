class BuyProductsController < ApplicationController
  def create
  	@buyproduct = BuyProduct.find(params[:id])
  	
  end

  def destroy
  end
end
