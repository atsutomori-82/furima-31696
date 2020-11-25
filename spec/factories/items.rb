FactoryBot.define do
  factory :item do
    name                        {"test"}
    text                        {"test"}
    category_id                 {10}
    condition_id                {2}
    region_id                   {2}
    shipping_id                 {2}
    shipping_day_id             {2}
    price                       {11111}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end   
  end
end
