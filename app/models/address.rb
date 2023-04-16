class Address < ApplicationRecord
  belongs_to :order
  belongs_to :prefecture

  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  #バリデーション
  # validates :post_code, presence: true,format: { with: /\A\d{3}[-]\d{4}\z/, message: "Post_Code is invalid." }  #郵便番号
  # validates :prefecture_id, numericality:{ other_than: 1 , message: "can't be blank"} #都道府県
  # validates :municipalities, presence: true   #市区町村
  # validates :address, presence: true   #番地
  # validates :building, presence: true   #建物名
  # validates :telephone_number, presence: true { with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)" }  #電話番号
end
