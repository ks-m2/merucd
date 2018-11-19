class Delivery < ApplicationRecord
	belongs_to :user
	has_many :buys
end
