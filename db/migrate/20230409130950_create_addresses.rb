class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code, null: false #郵便番号
      t.integer :prefecture_id, null: false #都道府県
      t.string :municipalities, null: false #市区町村
      t.string :address, null: false #番地
      t.string :building  #建物名
      t.string :telephone_number, null: false #電話番号
      t.references :order , null: false, foreign_key: true #オーダ
      t.timestamps
    end
  end
end
