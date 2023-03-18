# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------  | ------------------------ |
| nickname           | string  | null: false              | #ニックネーム
| email              | string  | null: false,unique: true | #メールアドレス
| encrypted_password | string  | null: false              | #パスワード
| firstname          | string  | null: false              | #名前（全角）名字
| lastname           | string  | null: false              | #名前(全角)名前
| firstname_kana     | string  | null: false              | #名前カナ（全角）名字
| lastname_kana      | string  | null: false              | #名前カナ(全角)名前
| date_of_birth      | date    | null: false              | #生年月日


### Association

- has_many :items
- has_many :orders


## items テーブル

| Column             | Type       | Options                        |
| -----------        | ---------- | ------------------------------ |
| item               | string     | null: false                    | #商品名
| content            | text       | null: false                    | #商品の詳細
| category_id        | integer    | null: false                    | #カテゴリー
| status_id          | integer    | null: false                    | #商品の状態
| shipping_cost_id   | integer    | null: false                    | #配送料の負担
| prefecture         | integer    | null: false                    | #発送元の地域
| days_to_ship_id    | integer    | null: false                    | #発送までの日数
| price              | integer    | null: false                    | #価格
| user               | references | null: false, foreign_key: true | #ユーザid

### Association

- belongs_to :user
- has_one :order

- belongs_to :category
- belongs_to :status
- belongs_to :shipping_cost
- belongs_to :prefecture
- belongs_to :days_to_ship


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true | #アイテムid
| user      | references | null: false, foreign_key: true | #ユーザid

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    | #郵便番号
| prefecture_id      | integer    | null: false                    | #都道府県
| municipalities     | string     | null: false                    | #市区町村
| address            | string     | null: false                    | #番地
| building           | string     |                                | #建物名
| telephone_number   | string     | null: false                    | #電話番号
| order              | references | null: false, foreign_key: true | #オーダーid

### Association

- belongs_to :order

- belongs_to :prefecture