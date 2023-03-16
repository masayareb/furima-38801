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
| year               | integer | null: false              | #年
| month              | integer | null: false              | #月
| day                | integer | null: false              | #日


### Association

- has_many :items
- has_many :orders


## items テーブル

| Column          | Type       | Options                        |
| -----------     | ---------- | ------------------------------ |
| item            | string     | null: false                    | #商品名
| content         | text       | null: false                    | #商品の詳細
| category        | string     | null: false                    | #カテゴリー
| status          | string     | null: false                    | #商品の状態
| shipping_cost   | string     | null: false                    | #配送料の負担
| region_of_origin| string     | null: false                    | #発送元の地域
| days_to_ship    | string     | null: false                    | #発送までの日数
| price           | integer    | null: false                    | #価格
| user            | references | null: false, foreign_key: true | #ユーザid

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true | #アイテムid
| user      | references | null: false, foreign_key: true | #ユーザid

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses


## addresses テーブル

| Column             | Type       | Options                        |
| ---------          | ---------- | ------------------------------ |
| post_code          | text       | null: false                    | #郵便番号
| prefectures        | text       | null: false                    | #都道府県
| municipalities     | text       | null: false                    | #市区町村
| address            | text       | null: false                    | #番地
| building           | text       | null: false                    | #建物名
| telephone_number   | text       | null: false                    | #電話番号
| order              | references | null: false, foreign_key: true | #オーダーid

### Association

- belongs_to :order
