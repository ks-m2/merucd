class ProductsController < ApplicationController


  def index
    @products = Product.all.order(created_at: "DESC")
    @users = User.all
    @user = current_user
    @jpops2 = Product.where(genre: 'J-POP')
    @jpops = @jpops2.order(created_at: "DESC")
    @kpops2 = Product.where(genre: 'K-POP',)
    @kpops = @kpops2.order(created_at: "DESC")
    @worlds2 = Product.where(genre: '洋楽')
    @worlds = @worlds2.order(created_at: "DESC")

  end

  def show
    @product = Product.find(params[:id])
    @product_comment = ProductComment.new
    @cart_product = CartProduct.new

  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to products_path
    else
      @product.errors.full_messages
      render "products/new"
    end

  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product.id)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params

    params.require(:product).permit(:artist,:album,:title,:image,:label,:genre,:status,:introduction,:count,:price,:new_price,
                                    discs_attributes: [:id, :number, :_destroy,
                                    songs_attributes: [:id, :title, :_destroy]])
  end


end