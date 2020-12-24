FactoryBot.define do
  factory :order_record do
    postal_code { '123-4567' }
    prefectures_id { 1 }
    municipality { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { "1234567890" }
    token {"tok_abcdefghijk00000000000000000"}
    user_id      {1}
    item_id      {1}
  end
end
