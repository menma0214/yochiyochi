# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 本番データ
# Facility.create(
#   title: 'アスレチックに水遊び、ものづくり体験もできる！お散歩コースも充実♪',
#   name: 'ふなばしアンデルセン公園',
#   furigana: 'フナバシアンデルセンコウエン',
#   address: %Q{〒274-0054\n千葉県船橋市金堀町525番},
#   business_hours: %Q{9:00~16:30 ※時期によっては17:00まで\n休園日あり\n詳細は公式HPのカレンダーをご覧ください。},
#   fee: %Q{一般:900円\n高校生(入園時、生徒証の提示必要あり):600円\n小・中学生:200円\n幼児(4歳以上):100円\n別途施設により施設利用料金あり},
#   target_age: '0歳〜3歳',
#   environment: '屋外(一部屋内施設あり)',
#   request: %Q{有料駐車場有\n普通車:500円\n大型車(要予約):2000円},
#   contact: 'TEL:047-457-6627',
#   facility_url: 'https://www.park-funabashi.or.jp/and/',
# )
# MVPリリース時ダミーデータ

require 'faker'
require 'open-uri'# 概要: open-uri ライブラリは、URLを開いてデータを読み込むためのシンプルなインターフェースを提供します。これにより、HTTPやFTPを通じてリモートのデータにアクセスし、ファイルをダウンロードすることが可能です。(S3の読み込みに使う)

Review.destroy_all
PlaygroundEquipment.destroy_all
Place.destroy_all
Event.destroy_all
Facility.destroy_all
User.destroy_all

# ユーザーデータの生成
10.times do
  User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

User.create!(
  name: "テスト",
  email: "test@test.com",
  password: "test",
  password_confirmation: "test"
)

User.create!(
  name: "管理者",
  email: "admin@admin.com",
  password: "admin",
  password_confirmation: "admin",
  role: 1
)

# S3の画像URLリスト
s3_image_urls = [
  "https://yochiyochi-images-videos.s3.ap-southeast-1.amazonaws.com/Tokyo_Tower.jpeg",
  "https://yochiyochi-images-videos.s3.ap-southeast-1.amazonaws.com/Skytree.jpeg",
  "https://yochiyochi-images-videos.s3.ap-southeast-1.amazonaws.com/uploads/review/image/2/yochiyochi.png",
  # 他の画像URLを追加
]

# 施設と関連データの生成
10.times do |i|
  facility = Facility.create!(
    title: Faker::Company.catch_phrase,
    name: Faker::Company.name,
    furigana: "ダミーシセツ",
    address: Faker::Address.full_address,
    business_hours: "09:00 - 17:00",
    fee: Faker::Number.between(from: 300, to: 5000).to_s,
    target_age: "1歳〜3歳",
    environment: "屋内",
    request: Faker::Lorem.word,
    contact: Faker::PhoneNumber.phone_number,
    facility_url: Faker::Internet.url,
    remote_image_url: s3_image_urls[i % s3_image_urls.length]
  )

  Place.create!(
    facility: facility,
    address: Faker::Address.full_address,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )

  6.times do |j|
    PlaygroundEquipment.create!(
      facility: facility,
      title: Faker::Lorem.word,
      kind: Faker::Lorem.word,
      target_age: "All ages",
      installation: Faker::Lorem.word,
      remarks: Faker::Lorem.sentence,
      remote_image_url: s3_image_urls[j % s3_image_urls.length]
    )
  end

  3.times do
    event = Event.create!(
      facility: facility,
      title: Faker::Company.catch_phrase,
      name: Faker::Lorem.word,
      furigana: "ダミーイベント",
      address: Faker::Address.full_address,
      business_hours: "09:00 - 17:00",
      fee: Faker::Number.between(from: 300, to: 5000).to_s,
      target_age: "All ages",
      environment: "屋外",
      request: Faker::Lorem.word,
      contact: Faker::PhoneNumber.phone_number,
      remote_image_url: s3_image_urls.sample
    )

    users = User.all
    10.times do
      review = Review.create!(
        user: users.sample,
        reviewable: [facility, event].sample,  # ランダムにfacilityかeventを設定
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph,
        rate: rand(1.0..5.0).round(1),
        remote_image_url: s3_image_urls.sample
      )
    end
  end
end
