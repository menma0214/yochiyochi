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

User.destroy_all
Facility.destroy_all
Place.destroy_all
PlaygroundEquipment.destroy_all
Review.destroy_all


10.times do
  User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

# S3の画像URLリスト
s3_image_urls = [
  "https://yochiyochi-images-videos.s3.ap-southeast-1.amazonaws.com/Tokyo_Tower.jpeg",
  "https://yochiyochi-images-videos.s3.ap-southeast-1.amazonaws.com/Skytree.jpeg",
  "https://yochiyochi-images-videos.s3.ap-southeast-1.amazonaws.com/uploads/review/image/2/yochiyochi.png",
  # 他の画像URLを追加
]

# 施設のダミーデータを生成
10.times do |i|
  facility = Facility.new(
    title: Faker::Company.catch_pherase,
    name: Faker::Company.name,
    furigana: "ダミーシセツ",
    address: Faker::Address.full_address,
    business_hours: "09:00 - 17:00",
    fee: Faker::Number.between(from: 300, to: 5000).to_s,# 利用料金を生成
    target_age: "1歳〜3歳",
    environment: "屋内",
    contact: Faker::PhoneNumber.phone_number,
    facility_url: Faker::Internet.url

  )
  # S3から画像をダウンロードして添付
  image_url = s3_image_urls[i % s3_image_urls.length]
  downloaded_image = URI.open(image_url)
  facility.image = downloaded_image
  facility.save!
  PlaygroundEquipment

  # Placesのダミーデータを生成
  Place.create!(
    facility: facility,
    address: Faker::Address.full_address,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )

  # PlaygroundEquipmentsのダミーデータを生成
  5.times do |j|
    playground_equipment = PlaygroundEquipment.new(
      facility: facility,
      title: Faker::Lorem.word,
      kind: Faker::Lorem.word,
      target_age: "All ages",
      installation: Faker::Lorem.word,
      remarks: Faker::Lorem.sentence
    )
    # S3から画像をダウンロードして添付
    # 施設１(i)の施設遊具(j)を利用し計算。
    # 例：施設1の遊具1: (1 * 5 + 0) % 3 = 5 % 3 = 2 (s3_image_urls[2])
    image_url = s3_image_urls[(i * 5 + j) % s3_image_urls.length]
    downloaded_image = URI.open(image_url)
    playground_equipment.image = downloaded_image
    playground_equipment.save!
  end

  # レビューのダミーデータを生成
  users = User.all

  10.times do
    Review.create!(
      user: users.sample,
      facility: facility,
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      rate: rand(1.0..5.0).round(1),
      image: Faker::LoremFlickr.image
    )

    image_url = s3_image_urls.sample
    downloaded_image = URI.open(image_url)
    review.image = downloaded_image
    review.save!
  end
end
puts "Dummy data with images created successfully!"
