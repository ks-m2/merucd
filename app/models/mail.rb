class Mail < ApplicationRecord
	validates :name, :email, :subject, :content, presence: true
	belongs_to :user
end
