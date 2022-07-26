require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end

      it 'buildingが空でも保存できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_cordが空では登録できない' do
        @order.post_cord = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post cord can't be blank")
      end

      it 'area_idが未選択では登録できない' do
        @order.area_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Area can't be blank")
      end
    
      it 'cityが空では登録できない' do
        @order.city = ''
        @order.valid?   
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'block_numberが空では登録できない' do
        @order.block_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Block number can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'post_cordは半角文字列以外だと登録できない' do
        @order.post_cord = 'ABC'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post cord is invalid")
      end

      it 'post_cordは7桁以上だと登録できない' do
        @order.post_cord = '12345678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post cord is invalid")
      end

      it 'post_cordは7桁以下だと登録できない' do
        @order.post_cord = '123456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post cord is invalid")
      end
      
      it 'post_cordはハイフンなしだと登録できない' do
        @order.post_cord = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post cord is invalid")
      end

      it 'phone_numberは半角数値以外では登録できない' do
        @order.phone_number = 'ABC'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは10桁以内では登録できない' do
        @order.phone_number = '12345678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは11桁以上では登録できない' do
        @order.phone_number = '000000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
