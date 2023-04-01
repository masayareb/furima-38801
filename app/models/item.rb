class Item < ApplicationRecord
  #アソシエーション
  belongs_to :user
  #has_one :order

  #Active Storageのアソシエーション
  has_one_attached :image

  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_to_ship

  #バリデーション
  validates :item, presence: true
  validates :image, presence: true
  validates :content, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
