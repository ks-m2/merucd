class Product < ApplicationRecord
	 enum genre: {J_POP: 0, 洋楽: 1, K_POP: 2, アニメ: 3, HIP_POP: 4, レゲエ: 5,
	 	ロック: 6, 演歌: 7, エレクトロニック: 8, クラシック: 9, メタル: 10}
	 enum status: {新品: 0, 未使用に近い: 1, 目立った傷汚れなし: 2, 傷汚れあり: 3, 状態が悪い: 4}
	belongs_to :user
	has_many :product_comments
	has_many :discs
	has_many :prices
	has_many :cart_products
	has_many :buy_products
	attachment :image
end
