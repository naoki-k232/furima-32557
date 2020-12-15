class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates  :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上かつ英数字をそれぞれ含めてください" }
  validates  :lastname, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/,message: "は全角文字を使用してください"}
  validates  :firstname, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/,message: "は全角文字を使用してください"}
  validates  :lastnamehuri, presence: true, format: {with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/,message: "全角カタカナのみで入力して下さい"}
  validates  :firstnamehuri, presence: true, format: {with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/,message: "全角カタカナのみで入力して下さい"}
  validates  :birthday, presence: true
end


# /\A[a-z\d]{8,100}+\z/i

# 全角ひらがな、全角カタカナ、漢字
# /\A[ぁ-んァ-ン一-龥]/