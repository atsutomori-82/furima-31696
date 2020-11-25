require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
  before do
    @item = FactoryBot.build(:item)
  end
 
    it "image,name,text,category,condition,shipping,region,shipping_day,priceが存在すれば登録できる" do
      expect(@item).to be_valid
    end

  it "商品名が必須であること" do
    @item.name = ''
    @item.valid?  
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end
  it "商品の説明が必須であること" do
    @item.text = ''
    @item.valid?  
    expect(@item.errors.full_messages).to include("Text can't be blank")
  end
  it "カテゴリーの情報が必須であること" do
    @item.category_id = ''
    @item.valid? 
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it "カテゴリーが数字で入力されていること" do
    @item.category_id = 'あ亜ア'
    @item.valid?  
    expect(@item.errors.full_messages).to include("Category is not a number")
  end
  it "カテゴリーが --- の時は出品できない" do
    @item.category_id = 1
    @item.valid?  
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end
  it "商品の状態についての情報が必須であること" do
    @item.condition_id = ''
    @item.valid?  
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end
  it "商品の状態について数字で入力されていること" do
    @item.condition_id = 'あ亜ア'
    @item.valid?  
    expect(@item.errors.full_messages).to include("Condition is not a number")
  end
  it "商品の状態が --- の時は出品できない" do
    @item.condition_id = 1
    @item.valid?  
    expect(@item.errors.full_messages).to include("Condition must be other than 1")
  end
  it "配送料の負担についての情報が必須であること" do
    @item.shipping_id = ''
    @item.valid?  
    expect(@item.errors.full_messages).to include("Shipping can't be blank")
  end
  it "配送料の負担について数字で入力されていること" do
    @item.shipping_id = 'あ亜ア'
    @item.valid?  
    expect(@item.errors.full_messages).to include("Shipping is not a number")
  end
  it "配送料の負担が --- の時は出品できない" do
    @item.shipping_id = 1
    @item.valid?  
    expect(@item.errors.full_messages).to include("Shipping must be other than 1")
  end
  it "発送元の地域についての情報が必須であること" do
    @item.region_id = ''
    @item.valid?  
    expect(@item.errors.full_messages).to include("Region can't be blank")
  end
  it "発送元の地域について数字で入力されていること" do
    @item.region_id = 'あ亜ア'
    @item.valid?  
    expect(@item.errors.full_messages).to include("Region is not a number")
  end
  it "発送元の地域が --- の時は出品できない" do
    @item.region_id = 1
    @item.valid?  
    expect(@item.errors.full_messages).to include("Region must be other than 1")
  end
  it "発送までの日数についての情報が必須であること" do
    @item.shipping_day_id = ''
    @item.valid?  
    expect(@item.errors.full_messages).to include("Shipping day can't be blank")
  end

  it "発送日までの日数について数字で入力されていること" do
    @item.shipping_day_id = 'あ亜ア'
    @item.valid?  
    expect(@item.errors.full_messages).to include("Shipping day is not a number")
  end
  it "発送日までの日数が --- の時は出品できない" do
    @item.shipping_day_id = 1
    @item.valid?  
    expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
  end
  it "価格についての情報が必須であること" do
    @item.price = ''
    @item.valid?  
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  it "価格について数字で入力されていること" do
    @item.price = 'あ亜ア'
    @item.valid? 
    expect(@item.errors.full_messages).to include("Price is invalid")
  end
  it "商品は￥300以上でなくては出品できない" do
    @item.price = 299
    @item.valid? 
    expect(@item.errors.full_messages).to include("Price must be greater than 299")
  end
  it "商品は￥9,999,999でなくては出品できない" do
    @item.price = 10000000
    @item.valid? 
    expect(@item.errors.full_messages).to include("Price must be less than 10000000")
  end
  it "商品画像を1枚つけることが必須であること" do
    @item.image = nil
    @item.valid?  
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  
end
end


"ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移すること"
"入力に問題がある状態で出品ボタンが押されたら、出品ページに戻りエラーメッセージが表示されること"