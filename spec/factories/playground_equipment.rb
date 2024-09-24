FactoryBot.define do
  factory :playground_equipment do
    title { Faker::Company.catch_phrase }
    kind { Faker::Company.name }
    target_age { "1歳〜5歳" }
    installation { Faker::Lorem.word }
    remarks { Faker::Lorem.sentence }
    min_age { Faker::Number.between(from: 0, to: 5) }
    max_age { Faker::Number.between(from: 0, to: 5) }
    association :facility
    # remote_image_url {"https://example.com/test_image.jpg"}# テスト用ダミーのURLを使用
  end
end
