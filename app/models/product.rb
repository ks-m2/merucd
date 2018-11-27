class Product < ApplicationRecord

	 enum genre: { 'J-POP': 0, 洋楽: 1, 'K-POP': 2, アニメ: 3, 'HIP-HOP': 4, レゲエ: 5,
	 	ロック: 6, 演歌: 7, エレクトロニック: 8, クラシック: 9, メタル: 10}
	 # enum genre: {aaa: 0, abb: 1, ccc: 3}
	 enum status: {新品: 0, 未使用に近い: 1, 目立った傷汚れなし: 2, 傷汚れあり: 3, 状態が悪い: 4}


	 validates :artist, presence:true

	 validates :album, {presence:true}
	 validates :label, {presence:true}
	 validates :genre, {presence:true}
	 validates :status, {presence:true}
	 validates :introduction, {presence:true}
	 # validates :count, {presence:true}
	 validates :count,  presence: true
	 # validates :price, {presence:true}
	 validates :price,  presence: true

	belongs_to :user
	has_many :product_comments, :dependent => :destroy

 	has_many :discs, inverse_of: :product, :dependent => :destroy
	accepts_nested_attributes_for :discs, allow_destroy: true

	has_many :cart_products, :dependent => :destroy
	has_many :buy_products, :dependent => :destroy
	attachment :image
end