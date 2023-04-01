require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品情報" do
    context '商品登録ができる' do
      it 'nickname、email、password、password_confirmation、firstname、lastname、firstname_kana 、lastname_kanadate_of_birthが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録ができない時' do
      it "ユーザが紐づいていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it "商品画像が空だと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空だと登録できない" do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end

      it "商品の説明が空だと登録できない" do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it "カテゴリが空だと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "カテゴリが１だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態が空だと登録できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "商品の状態が１だと登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "発送料の負担が空だと登録できない" do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it "発送料の負担が１だと登録できない" do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it "発送元が空だと登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "発送元が１だと登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "発送までの日数が空だと登録できない" do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it "発送までの日数が１だと登録できない" do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it "価格が空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "価格が300円〜9999999円外だと登録できない_200" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "価格が300円〜9999999円外だと登録できない_100000000" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "価格が半角数値以外だと登録できない_全角数字" do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "価格が半角数値以外だと登録できない_半角文字" do
        @item.price = 'aaaa11'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end

end
