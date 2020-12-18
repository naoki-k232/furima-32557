require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it '画像と商品名と商品の説明とカテゴリーと商品の状態と配送料の負担と発送元の地域と発送までの日数と価格があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it '商品名が空だと出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明がないと出品できない' do
        @item.produce_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Produce description can't be blank")
      end

      it '商品のカテゴリーがないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態がないと出品できない' do
        @item.produce_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Produce condition can't be blank")
      end

      it '配送料の負担がないと出品できない' do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end

      it '発送元の地域がないと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数がないと出品できない' do
        @item.days_to_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to delivery can't be blank")
      end

      it '販売価格がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は¥300以上でないと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格は¥9,999,999以下でないと出品できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '販売価格は半角数字でないと出品できない' do
        @item.price = '１２００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
