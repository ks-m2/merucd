class Product < ApplicationRecord
	enum genre: {J_POP: 1, 洋楽: 2, K_POP: 3, アニメ: 4, HIP_POP: 5, レゲエ: 6,
		ロック: 7, 演歌: 8, エレクトロニック: 9, クラシック: 10, メタル: 11}

	belongs_to :user
	has_many :product_comments
	has_many :discs
	has_many :prices
	has_many :cart_products
	has_many :buy_products
	attachment :image
end
