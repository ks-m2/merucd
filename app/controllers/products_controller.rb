class ProductsController < ApplicationController
  def index
    @product = Product.all

  end

  def show
    @product = Product.find(params[:id])
    @product_comment = ProductComment.new
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
  end

private
  def product_params
    params.require(:product).permit(:artist,:album,:title,:image,:label,:genre,:status,:introduction,:count,:price)
  end

end