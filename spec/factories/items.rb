FactoryBot.define do
  factory :item do
    title                     { 'hoge' }
    produce_description       { Faker::Lorem.sentence }
    category_id               { 2 }
    produce_condition_id      { 2 }
    shipping_charges_id       { 2 }
    prefecture_id             { 2 }
    days_to_delivery_id       { 1 }
    price                     { '1000' }
    association :user

    after(:build) do |image|
      image.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
