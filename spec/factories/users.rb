FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    lastname              { '佐藤' }
    firstname             { 'ころ' }
    lastnamehuri          { 'サトウ' }
    firstnamehuri         { 'コロ' }
    birthday              { '1990-01-01' }
  end
end
