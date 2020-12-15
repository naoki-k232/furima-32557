require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do


    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationと名字と名前と名字のカナと名前のカナと生年月日があれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上かつ英数字が含んであれば登録できる" do
        @user.password = "a00000"
        @user.password_confirmation = "a00000"
        expect(@user).to be_valid
      end

    end


    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end


      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password は6文字以上かつ英数字をそれぞれ含めてください")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "名字が空だと登録できない" do
        @user.lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank", "Lastname は全角文字を使用してください")
      end

      it "名前が空だと登録できない" do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank", "Firstname は全角文字を使用してください")
      end

      it "名字のカナが空だと登録できない" do
        @user.lastnamehuri = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastnamehuri can't be blank", "Lastnamehuri 全角カタカナのみで入力して下さい")
      end

      it "名前のカナが空だと登録できない" do
        @user.firstnamehuri = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstnamehuri can't be blank", "Firstnamehuri 全角カタカナのみで入力して下さい")
      end

      it "生年月日が空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end


    end

  end
end
