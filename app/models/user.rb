class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, {presence:true}
   has_many :mails
   has_many :products
   has_one :room
   has_many :talks
   has_many :product_comments
   has_one :cart
   has_many :deliveries
   has_many :buys

   attachment :image
   validates :name,:name_kana, {presence: true}
   validates :profile, presence: true, length: {maximum: 200}
end
