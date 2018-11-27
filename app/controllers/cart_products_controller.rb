class CartProductsController < ApplicationController

 before_action :cart_create, only: [:update]

  def cart_create
  	if @cart = Cart.where(user_id: current_user.id).exists?
  	else
  	 @cart = Cart.new(user_id: current_user.id)
  	 @cart.save
    end
  end


  def update
    # カートに入れるボタンを押したユーザーのカート
    @cart = Cart.find_by(user_id: current_user.id)
    # 現在カートに入れるボタンを押したユーザーのカート内の情報
    @current_carts = CartProduct.where(cart_id: @cart.id)

    # カートプロダクトの空のインスタンス
    @cart_product = CartProduct.new(cart_params)

    # 現在のカート内の情報をeachで回す
    @current_carts.each do |current_cart|
      # 現在のカートに同じ商品が入っていた場合
      if current_cart.product_id == params[:id]
        current_cart.count = current_cart.count + @cart_product.count
        current_cart.save
      # 現在のカートに同じ商品が入っていない場合
      else
        # 空のインスタンスにカート情報を入力
        @cart_product.cart_id = @cart.id
        @cart_product.product_id = params[:id]
        if @cart_product.save
        else
          @cart_product.errors.full_messages
          @product = Product.find(params[:id])
          @product_comment = ProductComment.new
          render "products/show"
        end
      end
    end
    redirect_to products_path
  end


  def destroy
    cart_product =  CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to carts_path
  end


  private
  def cart_params #---カートの中身を削除しようとすると、ここでエラーが起きるみたいです---#
    params.require(:cart_product).permit(:count)
  end

end

