class BuysController < ApplicationController
  def show
  	@buys = Buy.where(user_id: params[:id]).order("created_at DESC")
  end
end
