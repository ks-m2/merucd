class CartProduct < ApplicationRecord
	belongs_to :product
	belongs_to :cart

	validates :count,{presence: true}

end
