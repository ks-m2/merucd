class CartProductsController < ApplicationController

 before_action :cart_create, only: [:update]

  def update
    # カートに入れるボタンを押したユーザーのカート
    @cart = Cart.find_by(user_id: current_user.id)
    # カートプロダクトの空のインスタンス
    @cart_product = CartProduct.new(cart_params)

    @product = Product.find(params[:id])
    @current_product = CartProduct.find_by(product_id: params[:id])

    if CartProduct.where(product_id: params[:id]).exists?
      if @product.count <= @current_product.count
        flash[:notice] = "在庫がありません"
        render "products/show"
      elsif @product.count > @current_product.count
        @current_product.count = @current_product.count + @cart_product.count
        if @current_product.save
        else
          render "product/show"
        end
      end
    else
      # 空のインスタンスにカート情報を入力
      @cart_product.cart_id = @cart.id
      @cart_product.product_id = @product.id
      if @cart_product.save
      else
        @cart_product.errors.full_messages
        # 保存エラーが起きてrenderで飛ばすとき用
        @product_comment = ProductComment.new
        render "products/show"
      end
    end
    redirect_to products_path
  end


  def destroy
    cart_product =  CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to carts_path
  end

  def cart_create
    if @cart = Cart.where(user_id: current_user.id).exists?
    else
     @cart = Cart.new(user_id: current_user.id)
     @cart.save
    end
  end

  private
  def cart_params #---カートの中身を削除しようとすると、ここでエラーが起きるみたいです---#
    params.require(:cart_product).permit(:count)
  end

end

