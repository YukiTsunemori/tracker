class User < ApplicationRecord
  attr_accessor :remember_token
  # @remember_tokenにアクセスできるようにする。
  # DBのカラムではないので、DBに保存もしない


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

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続的セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
    # ランダムなトークンを生成=> User.new_token
    # それを仮想的なremember_tokenへ代入。
    # 文字列をハッシュ化するUser.digestの引数としてこれを渡す。（ハッシュ化される）
    # ハッシュ化されたトークンをupdate.attributeを使ってDBへ保存する。
  end

  # 渡されたトークンがDB内のダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
