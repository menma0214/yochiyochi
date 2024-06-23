# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Facility.create(title: '楽しいサンプル施設', name: '某所１', furigana: 'ボウショ', address: '〇〇県〇〇市〇〇１−１− 某子どもセンター', business_hours: '9:00~17:00', fee: '無料', target_age: '0歳〜3歳', environment: '屋内', request: '近くに駐車場有', contact: 'TEL:000-000-0000', facility_url: 'xxx.example.com')
PlaygroundEquipment.create(facility_id: 1, title: 'サンプル小さな子供向けの遊具があるよ', kind: '滑り台 玩具 本', target_age: '0歳〜3歳', installation: '滑り台２台/玩具、本複数', remarks: 'はいはいを始めたぐらいのお子様から遊べます！')

Facility.create(title: 'サンプル施設', name: '某所２', furigana: 'ボウショ', address: '〇〇県〇〇市〇〇１−１−１ 某センター２階', business_hours: '9:00~17:00', fee: '無料', target_age: '1歳〜3歳', environment: '屋内', request: '施設敷地内に駐車場有', contact: 'TEL:000-000-0000', facility_url: 'xxx.example.com')
PlaygroundEquipment.create(facility_id: 2, title: 'サンプル小さな子供向けの玩具があるよ', kind: 'ボールプール 玩具 本', target_age: '1歳〜3歳', installation: 'ボールプール/玩具、本複数', remarks: '歩き始めたぐらいのお子様から遊べます！')
