require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
  end

  describe "商品購入情報" do
    context '商品購入ができる' do
      it 'post_code、email、prefecture、municipalities、address、building、telephone_number tokenが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも保存ができる' do
      @order_address.building = ''
      expect(@order_address).to be_valid
      end
    end
    context '商品購入ができない時' do
      it "郵便番号が空だと登録できない" do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it "郵便番号が空だと登録できない(-なし)" do
        @order_address.post_code = '2222222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it "郵便番号が空だと登録できない(4-3構成)" do
        @order_address.post_code = '2222-222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it "郵便番号が空だと登録できない(4-4構成)" do
        @order_address.post_code = '2224-2224'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it "都道府県が空だと登録できない" do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "都道府県が1だと登録できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "市区町村が空だと登録できない" do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it "番地が空だと登録できない" do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号が空だと登録できない" do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it "電話番号が空だと登録できない" do
        @order_address.telephone_number = '000-0000-0000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end

      it "tokenが空だと登録できない" do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it "userが紐づいていないと保存できない" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it "itemが紐づいていないと保存できない" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
  
end
