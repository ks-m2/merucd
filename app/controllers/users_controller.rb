class UsersController < ApplicationController
  before_action :authenticate_user! ,only: [:show,:edit]
  def show #---マイページ画面---#
  	@user = User.find(params[:id])
    @talk = Talk.new
    @p = Room.find_by(user_id: params[:id])  #---インスタンス変数@pにRoomモデルのuser_idをユーザのURLから探してきている---#
    @talk1 = Talk.where(room_id: @p.id)

  end

  def edit
  	@user = User.find_by(id: current_user.id) #---マイページ編集画面---#
  end

  def update #---マイページ編集画面の情報アップデート---#
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
