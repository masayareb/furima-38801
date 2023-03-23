  require 'rails_helper'
  RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

    describe "新規登録ユーザ情報" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end

      it "emailが一意性でないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      
      it "emailは、@がないと登録できない" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end
      it "passwordが6文字未満だと登録できない" do
        @user.password = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end

      it "passwordとpassword（確認）が一致しないと登録できない" do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end

      it "passwordは半角英数字混合でないと登録できない" do
        @user.password = '00000000'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password Password is invalid. Include both letters and numbers")
      end
    end

    describe "新規登録本人情報確認" do
      it "お名前(全角)は、名字と名前がそれぞれ入力されていないと登録できない_名字" do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Lastname can't be blank")
      end

      it "お名前(全角)は、名字と名前がそれぞれ入力されていないと登録できない_名前" do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Firstname can't be blank")
      end

      it "お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない_名字" do
        @user.lastname = 'ﾔｽｺｳﾁ'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Lastname Lastname is invalid. Input full-width characters")
      end

      it "お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない_名前" do
        @user.firstname = 'masaya'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Firstname Firstname is invalid. Input full-width characters")
      end

      it "お名前カナ(全角)は、名字と名前がそれぞれ入力されていないと登録できない_名字" do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Lastname kana can't be blank")
      end

      it "お名前カナ(全角)は、名字と名前がそれぞれ入力されていないと登録できない_名前" do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Firstname kana can't be blank")
      end

      it "お名前カナ(全角)は、全角（カタカナ）での入力でないと登録できない_名字" do
        @user.lastname_kana = 'やすこうち'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Lastname kana Lastname_kana is invalid. Input full-width katakana characters")
      end

      it "お名前カナ(全角)は、全角（カタカナ）での入力でないと登録できない_名前" do
        @user.firstname_kana = 'ﾏｻﾔ'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Firstname kana firstname_kana is invalid. Input full-width katakana characters")
      end

      it "生年月日が空だと登録できない" do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Date of birth can't be blank")
      end
    end
  end