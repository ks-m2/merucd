class Buy < ApplicationRecord
	belongs_to :user
	has_many :buy_products, :dependent => :destroy
	belongs_to :delivery
end
