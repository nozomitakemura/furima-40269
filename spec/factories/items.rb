FactoryBot.define do
  factory :item do
    product_name { 'テスト商品' }
    product_explanation { 'テスト商品説明' }
    category_id { 2 }
    condition_id { 2 }
    contribution_id { 2 }
    prefecture_id { 2 }
    delivery_time_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
