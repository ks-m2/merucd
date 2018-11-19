class ApplicationController < ActionController::Base
# このsearchはヘッダーの検索フォーム表示用
before_action :search

<<<<<<< HEAD
  def index
  end

  def search
	  @q = Product.search
	  @q.build_condition if @q.conditions.empty?  #これによって条件をビルドしている。つまり、これを書かないとformが表示されない
  end
=======
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :portal, :state, :street, :adress, :tel])
  end

>>>>>>> df6e4f6bdb794a24bb8816fe01ae576db93731d0
end
