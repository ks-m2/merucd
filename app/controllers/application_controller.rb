class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :room_user
	before_action :cart_user
	before_action :buy_user

	def room_user
		if Room.where(user_id: current_user.id).exists?
		else
			@room = Room.new(user_id: current_user.id)
			@room.save
		end
	end
	def cart_user
		if Cart.where(user_id: current_user.id).exists?
		else
			@cart = Cart.new(user_id: current_user.id)
			@cart.save
		end
	end
	def buy_user
		if Buy.where(user_id: current_user.id).exists?
		else
			@buy = Buy.new(user_id: current_user.id)
			@buy.save
		end
	end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :portal, :state, :street, :adress, :tel])
  end

end


