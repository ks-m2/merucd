class Disc < ApplicationRecord
	belongs_to :product
	has_many :songs, inverse_of: :disc, :dependent => :destroy
	accepts_nested_attributes_for :songs, allow_destroy: true
end
