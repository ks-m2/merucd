class ProductsController < ApplicationController

  def index
    @product = Product.all
    @users = User.all
    @user = current_user
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to products_path
    else
      @product.errors.full_messages
      render "mails/new"
    end
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:artist,:album,:title,:image,:label,:genre,:status,:introduction,:count)
  end
end