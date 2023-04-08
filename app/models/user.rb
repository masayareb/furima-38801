class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #アソシエーション
  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "Password is invalid. Include both letters and numbers" }
  validates :nickname, presence: true
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Firstname is invalid. Input full-width characters" }
  validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Lastname is invalid. Input full-width characters" }
  validates :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "firstname_kana is invalid. Input full-width katakana characters" } 
  validates :lastname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Lastname_kana is invalid. Input full-width katakana characters" }
  validates :date_of_birth, presence: true
end
