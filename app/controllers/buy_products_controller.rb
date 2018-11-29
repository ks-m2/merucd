class BuyProductsController < ApplicationController

  def update
    # 空のデリバリーを生成し、ストロングパラメータで撮ってきたデータを入れる。またネストしたbuyモデルのidとpaymentも入る
    @delivery = Delivery.new(delivery_params)
    # 空のデリバリーのuser_idカラムに現在のユーザーidを入れる
    @delivery.user_id = current_user.id

    # 空のデリバリーを強制的に保存
    @delivery.save(validate: false)

    @current_buy = Buy.where(user_id: current_user.id).last

    # 現在のユーザーのカートを指定
    @cart = Cart.find_by(user_id: current_user.id)

    # カートプロダクトの中から現在のユーザーのカートを持ってくる。
    @cartproducts = CartProduct.where(cart_id: @cart.id)

    # 持ってきた現在のユーザーのカートをcartproductの変数に入れる
    @cartproducts.each do |cartproduct|

    # 空のインスタンス変数を作成
    @buyproduct = BuyProduct.new

        # 空の@buyproductのproduct_idカラムに持ってきた現在のユーザーのカートのproduct_idを入れる
        @buyproduct.product_id = cartproduct.product_id
        # 空の@buyproductのbuy_ idカラムに持現在のユーザーのbuy_idを入れる。
        @buyproduct.buy_id = @current_buy.id
        # 空の@buyproductのcountカラムに現在のカートプロダクトの数を入れる
        @buyproduct.count = cartproduct.count

        @buyproduct.delivery_status = "配送準備中"

        # 空のbuyproductに購入時点の価格を入れる
        if cartproduct.product.new_price == nil
          @buyproduct.price = cartproduct.product.price
        else
          @buyproduct.price = cartroduct.product.new_price
        end
        @buyproduct.save

        # cartproductに入っているproductを出す
        @product = Product.find(cartproduct.product_id)
        # 数をへらす
        @product.count = @product.count - cartproduct.count
        @product.save
    end
      @cart.destroy
      redirect_to products_path
  end

  def destroy
  end

  private

    def delivery_params
      params.require(:delivery).permit(:name,:postal,:state,:street,:address,:tel, buys_attributes: [:id, :payment, :user_id])
	  end
end







