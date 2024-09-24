FactoryBot.define do
  factory :review do
    title {Faker::Lorem.sentence}
    body {Faker::Lorem.paragraph}
    rate {rand(1.0..5.0).round(1)}
    association :user  # ユーザーとの関連付け
    association :reviewable, factory: :facility, factory: :event  # 施設またはイベントとの関連付け
    # remote_image_url {"https://example.com/test_image.jpg"}# テスト用ダミーのURLを使用
  end
end
