class User < ApplicationRecord
  # callback関数 => ユーザーをDBへ保存する前にemail属性を強制的に小文字へ変換する。
  # selfは現在のユーザーを指す。
  before_save { self.email = email.downcase } 

  validates :name, presence: true,  length: { maximum: 50 }
  #　正規表現を定数へ代入。以下、Emailのvalidationでformatで使用する。
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
  # => 1. ハッシュ化したパスワードをDB内のカラム、password_digestに保存できる。
  # => 2. ２つの仮想的な属性(passwordとpassword_confirmation)が使える。また存在性と値が一致するかどうかのバリデーションも追加される。
  # => 3. authenticateメソッドが使える。一致しない場合はfalseを返す。
end
