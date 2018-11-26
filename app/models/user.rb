class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum deleted_at: {登録中: 0, 退会済み: 1}

  def active_for_authentication?
    super && self.deleted_at == "登録中"
  end

  def inactive_message
    self.deleted_at == "登録中" ? super: :退会済みのユーザーです
  end

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