class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   has_many :mails
   has_many :products
   has_one :room
   has_many :talks
   has_many :product_comments
   has_one :cart
   has_many :deliveries
   has_many :buys

   attachment :image
   validates :name,:name_kana, :email, :password,:password_confirmation,:postal,:state,:street,:adress,:tel,{presence: true}


   validates :tel, length:{minimum:10}
   validates :tel, length:{maximum:11}
   validates :postal, length:{is:7}
   validates :password,length:{minimum:6}


end
