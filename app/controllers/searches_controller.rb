class SearchesController < ApplicationController
  def search #わかりにくいけどapplicationのサーチとは同名の別アクション。本当は別名にしたいけどすることで支障でるかよくわからなくて怖いからこのままにしてる。
    @products = Product.page(params[:page]).reverse_order
    @users = User.all
    @user = current_user
    # ここ以下ransack（検索機能用）
    #params[:q]はpermitted: falseだがransackでは問題ない。つまりストロングパラメータを使っても使わなくてもいい
    @q = Product.search(params[:q]) #@q = Book.ransack(search_params)でも同じこと。探す条件を生成していている
    @q.build_condition if @q.conditions.empty?  #これによって条件をビルドしている。つまり、これを書かないとformが表示されない
    
    @result = @q.result(distinct: true) #実際に検索している。ここでSQLが叩かれる
  end
end
