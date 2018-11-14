class Product < ApplicationRecord
	belongs_to :user
	has_many :product_comments
	has_many :discs
	has_many :prices
	has_many :cart_products
	has_many :buy_products
end
