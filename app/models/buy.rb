class Buy < ApplicationRecord
	belongs_to :user
	has_many :buy_products
	belongs_to :delivery
end
