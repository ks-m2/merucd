class UsersController < ApplicationController
  before_action :authenticate_user! ,only: [:show,:edit]
  def show
  	@user = User.find(params[:id])
    @talk = Talk.new
    

  end

  def edit
  	@user = User.find_by(id: params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
         sign_in(@user, bypass: true) #---deviseではパスワードを変更するとログアウトする仕組みの為記入をしました---#
  		redirect_to user_path(@user), notce: "保存しました"
  	else
  		render :edit
  	end
  end

  def destroy
    
  end
end
private
def user_params
	params.require(:user).permit(:name, :name_kana, :email, :password,:password_confirmation,:postal,:state,:street,:adress,:tel,:profile,:image)
end
