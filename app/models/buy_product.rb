class BuyProduct < ApplicationRecord
	belongs_to :product
	belongs_to :buy
end
