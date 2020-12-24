require 'rails_helper'

RSpec.describe OrderRecord, type: :model do
  describe '配送先の保存' do
    before do
      @order_record = FactoryBot.build(:order_record)
    end

    describe '保存ができるとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_record).to be_valid
      end

      it '建物名が空でも登録できること' do
        @order_record.building_name = nil
        expect(@order_record).to be_valid
      end
    end
    

    describe '保存できないとき' do
      it '郵便番号が空だと登録できないこと' do
        @order_record.postal_code = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Postal code can't be blank")
      end
  
      it '郵便番号が半角のハイフンを含んだ形式出ないと保存できない' do
        @order_record.postal_code = 1234567
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
  
      it '都道府県を選択していないと保存できない' do
        @order_record.prefectures_id = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Prefectures can't be blank")
      end
  
      it '市区町村が空だと保存できない' do
        @order_record.municipality = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Municipality can't be blank")
      end
  
      it '番地が空だと保存できない' do
        @order_record.house_number = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @order_record.phone_number = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号に半角のハイフンがあると保存できない' do
        @order_record.phone_number = 190-1234-5678
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号は11桁以内でないと保存できない' do
        @order_record.phone_number = 000000000000
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空だと保存できない' do
        @order_record.token = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
