require 'rails_helper'

RSpec.describe Event, type: :model do

  context '全てのフィールドが有効な場合' do
    it '有効であること' do
      event = build(:event)
      expect(event).to be_valid
    end
  end

  context '画像、動画以外の詳細情報が一つでも存在しない場合' do
    it '無効であること' do
      event = build(:event,
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
                        event_url: nil,
                        min_age: nil,
                        max_age: nil,
                        start_date: nil,
                        end_date: nil)
      event.valid?
      expect(event.errors[:title]).to include('を入力してください')
      expect(event.errors[:name]).to include('を入力してください')
      expect(event.errors[:furigana]).to include('を入力してください')
      expect(event.errors[:address]).to include('を入力してください')
      expect(event.errors[:business_hours]).to include('を入力してください')
      expect(event.errors[:fee]).to include('を入力してください')
      expect(event.errors[:target_age]).to include('を入力してください')
      expect(event.errors[:environment]).to include('を入力してください')
      expect(event.errors[:request]).to include('を入力してください')
      expect(event.errors[:contact]).to include('を入力してください')
      expect(event.errors[:event_url]).to include('を入力してください')
      expect(event.errors[:min_age]).to include('を入力してください')
      expect(event.errors[:max_age]).to include('を入力してください')
      expect(event.errors[:start_date]).to include('を入力してください')
      expect(event.errors[:end_date]).to include('を入力してください')
    end
  end

  context 'タイトル、施設名、フリガナが255文字以内の場合' do
    it '有効であること' do
      event = build(:event,
                        title: 'a' * 255,
                        name: 'b' * 255,
                        furigana: 'c' * 255
                      )
      expect(event).to be_valid
    end
  end

  context 'タイトル、イベント名、フリガナが255文字以上の場合' do
    it '無効であること' do
      event = build(:event,
                        title: 'a' * 256,
                        name: 'b' * 256,
                        furigana: 'c' * 256
                      )
      expect(event).to be_invalid
      expect(event.errors[:title]).to include('は255文字以内で入力してください')
      expect(event.errors[:name]).to include('は255文字以内で入力してください')
      expect(event.errors[:furigana]).to include('は255文字以内で入力してください')
    end
  end

  context '要望・備考が65535文字以内の場合' do
    it '有効であること' do
      event = build(:event, request: 'd' * 65535)
      expect(event).to be_valid
    end
  end

  context '要望・備考が65535文字以上の場合' do
    it '無効であること' do
      event = build(:event, request: 'd' * 65536)
      expect(event).to be_invalid
      expect(event.errors[:request]).to include('は65535文字以内で入力してください')
    end
  end
end
