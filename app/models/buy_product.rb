class BuyProduct < ApplicationRecord
	belongs_to :product
	belongs_to :buy
	enum delivery_status: {配送準備中: 0, 配送中: 1, 出荷済み: 2}
end
