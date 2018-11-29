class Delivery < ApplicationRecord
	belongs_to :user
	has_many :buys, inverse_of: :delivery
	accepts_nested_attributes_for :buys
end