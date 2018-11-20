class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @talk = Talk.new
    @product = Product.find(params[:id])

  end

  def edit
  	@user = User.find_by(id: params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(current_user), notce: "保存しました"
  	else
  		render :edit
  	end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to current_user
  end
end
private
def user_params
	params.require(:user).permit(:name, :name_kana, :email, :password,:password_confirmation,:portal,:state,:street,:adress,:tel,:profile,:image)
end
