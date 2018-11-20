class BuyProductsController < ApplicationController
	before_action :buy_user,only:[:create]
  def create
  	@buyproduct = BuyProduct.find(params[:id])
  	
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
