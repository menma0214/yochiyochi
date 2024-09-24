FactoryBot.define do
  factory :event do
    title { Faker::Company.catch_phrase }
    name { Faker::Company.name }
    furigana { "テストイベント" }
    address { Faker::Address.full_address }
    business_hours { "10:00-18:00" }
    fee { Faker::Number.between(from: 300, to: 5000).to_s }
    target_age { "1歳〜5歳" }
    environment { '屋内' }
    request { Faker::Lorem.word }
    contact { Faker::PhoneNumber.phone_number }
    min_age { Faker::Number.between(from: 0, to: 5) }
    max_age { Faker::Number.between(from: 0, to: 5) }
    event_url { Faker::Internet.url }
    association :facility
    # remote_image_url {"https://example.com/test_image.jpg"}# テスト用ダミーのURLを使用
  end
end
