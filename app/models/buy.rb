class Buy < ApplicationRecord
	belongs_to :user
	has_many :buy_products, :dependent => :destroy
	belongs_to :delivery, inverse_of: :buys, optional: true
	enum payment: {クレジットカード: 0, 代金引換: 1, コンビニ払い: 2, 銀行振込: 3}
end