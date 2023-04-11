class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building, :telephone_number, :user_id, :item_id, :token
  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(user_id: user_id,item_id: item_id,token: token)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end