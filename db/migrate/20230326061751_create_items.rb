class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item ,null: false #商品名
      t.text   :content ,null: false #商品の詳細
      t.integer :category_id ,null: false #カテゴリー
      t.integer :status_id ,null: false #商品の状態
      t.integer :shipping_cost_id ,null: false #配送料の負担
      t.integer :prefecture_id ,null: false #発送元の地域
      t.integer :days_to_ship_id ,null: false #発送までの日数
      t.integer :price ,null: false #価格
      t.references :user ,null: false, foreign_key: true  #ユーザid
      
      t.timestamps
    end
  end
end
