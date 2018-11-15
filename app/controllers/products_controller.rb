class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product = Product.new
    @users = User.all
    @user = current_user
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
