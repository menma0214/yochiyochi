require 'rails_helper'

RSpec.describe PlaygroundEquipment, type: :model do

  context '全てのフィールドが有効な場合' do
    it '有効であること' do
      pe = build(:playground_equipment)
      expect(pe).to be_valid
    end
  end

  context '画像、動画以外の詳細情報が一つでも存在しない場合' do
    it '無効であること' do
      pe = build(:playground_equipment,
                        title: nil,
                        kind: nil,
                        target_age: nil,
                        installation: nil,
                        remarks: nil,
                        min_age: nil,
                        max_age: nil)
      pe.valid?
      expect(pe.errors[:title]).to include('を入力してください')
      expect(pe.errors[:kind]).to include('を入力してください')
      expect(pe.errors[:target_age]).to include('を入力してください')
      expect(pe.errors[:installation]).to include('を入力してください')
      expect(pe.errors[:remarks]).to include('を入力してください')
      expect(pe.errors[:min_age]).to include('を入力してください')
      expect(pe.errors[:max_age]).to include('を入力してください')
    end
  end

  context 'タイトル、遊具・設備名、フリガナが255文字以上の場合' do
    it '無効であること' do
      pe = build(:playground_equipment,
                        title: 'a' * 256,
                        kind: 'b' * 256
                      )
      expect(pe).to be_invalid
      expect(review.errors[:body]).to include('は255文字以内で入力してください')
    end
  end

  context 'タイトル、遊具・設備名、フリガナが255文字以内の場合' do
    it '有効であること' do
      pe = build(:playground_equipment,
                        title: 'a' * 255,
                        kind: 'b' * 255
                      )
      expect(pe).to be_valid
    end
  end

  context '要望・備考が65535文字以内の場合' do
    it '有効であること' do
      pe = build(:playground_equipment, remarks: 'd' * 65535)
      expect(pe).to be_valid
    end
  end

  context '要望・備考が65535文字以上の場合' do
    it '無効であること' do
      pe = build(:playground_equipment, remarks: 'd' * 65536)
      expect(pe).to be_invalid
      expect(review.errors[:body]).to include('は65535文字以内で入力してください')
    end
  end

end
