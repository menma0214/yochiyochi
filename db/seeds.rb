# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Facility.create(
  title: '東京タワー（ダミー）',
  name: '某所１',
  furigana: 'ボウショ',
  address: '〒105-0011 東京都港区芝公園４丁目２−８',
  business_hours: '9:00~17:00',
  fee: '無料',
  target_age: '0歳〜3歳',
  fee: "無料",
  environment: '屋内',
  request: '近くに駐車場有',
  contact: 'TEL:000-000-0000',
  facility_url: 'https://xxx.example.com',
  image:"https://yochiyochi-images-videos.s3.ap-southeast-1.amazonaws.com/Tokyo_Tower.jpeg"
)

Facility.create(
  title: 'スカイツリー（ダミー）',
  name: '某所２',
  furigana: 'ボウショ',
  address: '〒131-0045 東京都墨田区押上１丁目１−２',
  business_hours: '9:00~17:00',
  fee: '無料',
  target_age: '1歳〜3歳',
  fee: "100円",
  environment: '屋内',
  request: '施設敷地内に駐車場有',
  contact: 'TEL:000-000-0000',
  facility_url: 'https://xxx.example.com',
  image:"https://yochiyochi-images-videos.s3.ap-southeast-1.amazonaws.com/Skytree.jpeg"
)

PlaygroundEquipment.create(
  facility_id: 1,
  title: 'サンプル小さな子供向けの遊具があるよ',
  kind: '滑り台 玩具 本',
  target_age: '0歳〜3歳',
  installation: '滑り台２台/玩具、本複数',
  remarks: 'はいはいを始めたぐらいのお子様から遊べます！'
)

PlaygroundEquipment.create(
  facility_id: 2,
  title: 'サンプル小さな子供向けの玩具があるよ',
  kind: 'ボールプール 玩具 本',
  target_age: '1歳〜3歳',
  installation: 'ボールプール/玩具、本複数',
  remarks: '歩き始めたぐらいのお子様から遊べます！'
)

Place.create(facility_id: 1,
  address: "〒105-0011 東京都港区芝公園４丁目２−８",
  latitude: 35.65879840305099,
  longitude: 139.74546508293085
)

Place.create(facility_id: 2,
  address: "〒131-0045 東京都墨田区押上１丁目１−２",
  latitude: 35.710286256466425,
  longitude: 139.8107105479794
)

facility = Facility.find(1)
facility.remote_image_url="https://yochiyochi-images-videos.s3.ap-southeast-1.amazonaws.com/Tokyo_Tower.jpeg"
facility.save

facility2 = Facility.find(2)
facility2.remote_image_url="https://yochiyochi-images-videos.s3.ap-southeast-1.amazonaws.com/Skytree.jpeg"
facility2.save
