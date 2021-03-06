class UsersController < ApplicationController
  before_action :authenticate_user! ,only: [:show,:edit]
  before_action :room_user, only:[:show]

  def show #---マイページ画面---#
  	@user = User.find(params[:id])
    @talk = Talk.new
    @room = Room.find_by(user_id: params[:id])
    @talk1 = Talk.where(room_id: @room.id)
    # @p = Room.find_by(id: params[:id])  #---インスタンス変数@pにRoomモデルのuser_idをユーザのURLから探してきている---#
    # @talk1 = Talk.where(room_id: @p.id)
    @buys = Buy.where(user_id: current_user.id)
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
    @user = User.find(params[:id])
    @user.update_attribute(:deleted_at, 1)
    @user.products.destroy
    @user.talks.destroy
    @user.product_comments.destroy
    redirect_to new_user_registration_path
  end

  def delivery
    @buys = Buy.where(user_id: current_user.id)
  end

  def delivery_create
    @buy = Buy.where(user_id: current_user.id)
    @buy.each do |buy|
      buy.buy_products.each do |buy_product|
        name = buy_product.id.to_s + "_delivery_status"
        buy_product.delivery_status = params[name]
        buy_product.save
      end
    end
    redirect_to user_path(current_user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:name, :name_kana, :email, :password,:password_confirmation,:postal,:state,:street,:adress,:tel,:profile,:image)
  end
  def room_user
      if Room.where(user_id: params[:id]).exists?
      else
        @room = Room.new(user_id: params[:id])
        @room.save
      end
  end

end
