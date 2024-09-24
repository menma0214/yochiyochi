FactoryBot.define do
  factory :facility do
    title { Faker::Company.catch_phrase }
    name { Faker::Company.name }
    furigana { "テストシセツ" }
    address { Faker::Address.full_address }
    business_hours { "10:00-18:00" }
    fee { Faker::Number.between(from: 300, to: 5000).to_s }
    target_age { "1歳〜5歳" }
    environment { '屋内' }
    request { Faker::Lorem.word }
    contact { Faker::PhoneNumber.phone_number }
    facility_url { Faker::Internet.url }
    min_age { Faker::Number.between(from: 0, to: 5) }
    max_age { Faker::Number.between(from: 0, to: 5) }
    # remote_image_url {"https://example.com/test_image.jpg"}# テスト用ダミーのURLを使用
  end
end
