FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    prefecture_id { 2 }
    municipalities { '東京都' }
    block { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '07056029090' }
    token { 'tok_abcdefghijk00000000000000000' }
    # association :user # モデルではないので使用できない
  end
end
