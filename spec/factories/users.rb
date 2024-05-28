FactoryBot.define do
  factory :user do
  nick_name             {'たろうちゃん'}
  first_name             {'太朗'}
  family_name             {'田中'}
  first_name_kana             {'タロウ'}
  family_name_kana             {'タナカ'}
  birth_day { Date.new(2000, 1, 1) }
  email                 {Faker::Internet.email}
  password              {'1a'+Faker::Internet.password(min_length: 6)}
  password_confirmation {password}
end
end