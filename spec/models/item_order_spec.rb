require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品購入情報の保存' do
    before do
      @userA = FactoryBot.create(:user)
      @userB = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @userA.id)
      @item_order = FactoryBot.build(:item_order, item_id: @item.id, user_id: @userB.id)
    end

    it '全てに正しい値を入力して保存成功' do
      expect(@item_order).to be_valid
    end

    it '郵便番号が空で失敗' do
      @item_order.post_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post number can't be blank")
    end
    it '都道府県が空で失敗' do
      @item_order.region_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Region can't be blank")
    end
    it '市区町村が空で失敗' do
      @item_order.city = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空で失敗' do
      @item_order.address = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空で失敗' do
      @item_order.tel = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Tel can't be blank")
    end
    it 'トークンが空で失敗' do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号に数字以外を入力して失敗' do
      @item_order.post_number = 'abc'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
    end
    it '郵便番号にハイフンを入力せず失敗' do
      @item_order.post_number = '1234567'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
    end
    it '郵便番号の数字のケタ数が合わず失敗' do
      @item_order.post_number = '1234-567'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
    end
    it '都道府県が---だと失敗' do
      @item_order.region_id = 1
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Region must be other than 1')
    end
    it '電話番号に数字以外を入力して失敗' do
      @item_order.tel = 'abc'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Tel is invalid. Only integer')
    end
    it 'user_idが空だとして失敗' do
      @item_order.user_id = ''
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("User can't be blank")
    end
    it '電話番号に数字以外を入力して失敗' do
      @item_order.item_id = ''
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Item can't be blank")
    end
  end
end
