require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '商品が出品できる時' do
      it 'image, title, text, category_id, item_condition_id, delivery_charge_id, ship_from_id, days_to_ship_id, item_priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'titleが40文字以内なら出品できる' do
        @item.title = 'aaaaaa'
        expect(@item).to be_valid
      end
      it 'textが1,000文字以内なら出品できる' do
        @item.text = 'aaaaaa'
        expect(@item).to be_valid
      end
      it 'item_priceが300~9,999,999なら出品できる' do
        @item.item_price = 500
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない時' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'item_priceが空では登録できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'titleが41文字以上では登録できない' do
        @item.title = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Title is too long (maximum is 40 characters)')
      end
      it 'textが1,000文字以上では登録できない' do
        @item.text = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Text is too long (maximum is 1000 characters)')
      end
      it 'item_priceが299以下では登録できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than 300')
      end
      it 'item_priceが10,000,000以上では登録できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than 9999999')
      end
      it "半角英数混合では登録できない"do
        @item.item_price = "aa34ft4"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it "半角英語だけでは登録できないこと" do
        @item.item_price = "aaaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it "全角文字では登録できないこと" do
        @item.item_price = "ああああああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'item_condition_idが1では登録できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item condition must be other than 1')
      end
      it 'delivery_charge_idが1では登録できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge must be other than 1')
      end
      it 'ship_from_idが1では登録できない' do
        @item.ship_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship from must be other than 1')
      end
      it 'days_to_ship_idが1では登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
    end
  end
end
