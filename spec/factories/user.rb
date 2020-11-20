FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"高井"}
    first_name            {"あゆ実"}
    family_name_kana      {"タカイ"}
    first_name_kana       {"アユミ"}
    birthday              {"2020-11-18"}
  end
end