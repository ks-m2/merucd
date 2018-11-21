class Product < ApplicationRecord
	 enum genre: {j_pop: 0, world: 1, k_pop: 2, anime: 3, hip_hop: 4, reggae: 5,
	 	rock: 6, ballad: 7, electronuc: 8, classic: 9, metal: 10}
	 # enum genre: {aaa: 0, abb: 1, ccc: 3}
	 enum status: {新品: 0, 未使用に近い: 1, 目立った傷汚れなし: 2, 傷汚れあり: 3, 状態が悪い: 4}
	 validates :artist, {presence:true}
	 validates :album, {presence:true}
	 validates :label, {presence:true}
	 validates :genre, {presence:true}
	 validates :status, {presence:true}
	 validates :introduction, {presence:true}
	 validates :count, {presence:true}
	 validates :price, {presence:true}


	belongs_to :user
	has_many :product_comments
	has_many :discs
	has_many :prices
	has_many :cart_products
	has_many :buy_products
	attachment :image
end
