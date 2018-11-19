class ApplicationController < ActionController::Base
# このsearchはヘッダーの検索フォーム表示用
before_action :search

  def index
  end

  def search
	  @q = Product.search
	  @q.build_condition if @q.conditions.empty?  #これによって条件をビルドしている。つまり、これを書かないとformが表示されない
  end
end
