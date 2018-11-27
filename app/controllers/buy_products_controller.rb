class BuyProductsController < ApplicationController
	before_action :buy_user,only:[:update]
  def update

    @buyproduct = BuyProduct.new
    @cart = Cart.find_by(user_id:params[:id]) #---cartindexの購入画面へ進むのlinkによるパラメータの受け渡し　get---#
    @cartproducts = CartProduct.where(cart_id: @cart.id) #---カートのユーザidが当てはまるものを複数取得---#
    @buy = Buy.find_by(user_id:params[:id])

    @cartproducts.each do |cartprodut|
      @buyproduct.product_id = cartproduct.product_id


      @buyproduct.buy_id = @buy.id

      @buyproduct.count = cartproduct.count

      if cartproduct.product.new_price == nil
        @buyproduct.price = cartproduct.product.price
      else
        @buyproduct.price = cartroduct.product.new_price
      end
      @buyproduct.save   #---購入履歴のセーブ---#

      @cartproducts.destroy #---カートの中身削除---#
    end
      # ---delivery--- #
      @delivery = Delivery.new(delivery_params) #---配送先のセーブ---#
      @user = User.find(params[:id])
      @delibery.user_id = @user.id
      @delivery.save

      redirect_to products_path

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
    def delivery_params
      params.require(:delivery).permit(:name,:portal,:state,:street,:address,:tel)
	end
end
