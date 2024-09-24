require 'rails_helper'

RSpec.describe Facility, type: :model do

  context '全てのフィールドが有効な場合' do
    it '有効であること' do
      facility = build(:facility)
      expect(facility).to be_valid
    end
  end

  context '画像、動画以外の詳細情報が一つでも存在しない場合' do
    it '無効であること' do
      facility = build(:facility,
                        title: nil,
                        name: nil,
                        furigana: nil,
                        address: nil,
                        business_hours: nil,
                        fee: nil,
                        target_age: nil,
                        environment: nil,
                        request: nil,
                        contact: nil,
                        facility_url: nil,
                        min_age: nil,
                        max_age: nil)
      facility.valid?
      expect(facility.errors[:title]).to include('を入力してください')
      expect(facility.errors[:name]).to include('を入力してください')
      expect(facility.errors[:furigana]).to include('を入力してください')
      expect(facility.errors[:address]).to include('を入力してください')
      expect(facility.errors[:business_hours]).to include('を入力してください')
      expect(facility.errors[:fee]).to include('を入力してください')
      expect(facility.errors[:target_age]).to include('を入力してください')
      expect(facility.errors[:environment]).to include('を入力してください')
      expect(facility.errors[:request]).to include('を入力してください')
      expect(facility.errors[:contact]).to include('を入力してください')
      expect(facility.errors[:facility_url]).to include('を入力してください')
      expect(facility.errors[:min_age]).to include('を入力してください')
      expect(facility.errors[:max_age]).to include('を入力してください')
    end
  end

  context 'タイトル、施設名、フリガナが255文字以内の場合' do
    it '有効であること' do
      facility = build(:facility,
                        title: 'a' * 255,
                        name: 'b' * 255,
                        furigana: 'c' * 255
                      )
      expect(facility).to be_valid
    end
  end

  context 'タイトル、施設名、フリガナが255文字以上の場合' do
    it '無効であること' do
      facility = build(:facility,
                        title: 'a' * 256,
                        name: 'b' * 256,
                        furigana: 'c' * 256
                      )
      expect(facility).to be_invalid
      expect(review.errors[:body]).to include('は255文字以内で入力してください')
    end
  end

  context '要望・備考が65535文字以内の場合' do
    it '有効であること' do
      facility = build(:facility, request: 'd' * 65535)
      expect(facility).to be_valid
    end
  end

  context '要望・備考が65535文字以上の場合' do
    it '無効であること' do
      facility = build(:facility, request: 'd' * 65536)
      expect(facility).to be_invalid
      expect(review.errors[:body]).to include('は65535文字以内で入力してください')
    end
  end

end
