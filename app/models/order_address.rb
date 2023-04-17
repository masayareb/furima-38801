class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }  #郵便番号
    validates :municipalities   #市区町村
    validates :address   #番地
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }  #電話番号
    validates :user_id  #ユーザid
    validates :item_id  #アイテムid
    validates :token
  end
  validates :prefecture_id, numericality:{ other_than: 1 , message: "can't be blank"} #都道府県

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end