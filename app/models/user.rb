class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は6文字以上かつ半角英数字をそれぞれ含めてください' }

  with_options presence: true do
    validates  :nickname
    validates  :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角の漢字・平仮名・カタカナ文字を使用してください' }
    validates  :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角の漢字・平仮名・カタカナ文字を使用してください' }
    validates  :lastnamehuri, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナのみで入力して下さい' }
    validates  :firstnamehuri, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナのみで入力して下さい' }
    validates  :birthday
  end

  has_many :items
  has_many :records
end
