class BuysController < ApplicationController
  def show
  	@buys = Buy.where(user_id: current_user.id).order("created_at DESC")
  end
end

