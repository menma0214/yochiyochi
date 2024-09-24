require 'rails_helper'

RSpec.describe Review, type: :model do

  context '全てのフィールドが有効な場合' do
    it '有効であること' do
      review = build(:review)
      expect(review).to be_valid
    end
  end

  context '本文が存在しない場合' do
    it '無効であること' do
      review = build(:review, body: nil)
      expect(review).to be_invalid
      expect(review.errors[:body]).to include('を入力してください')
    end
  end

  context '本文が65535文字以内の場合' do
    it '有効であること' do
      review = build(:review, body: 'a' * 65535)
      expect(review).to be_valid
    end
  end

  context '本文が65536文字以上の場合' do
    it '無効であること' do
      review = build(:review, body: 'a' * 65536)
      expect(review).to be_invalid
      expect(review.errors[:body]).to include('は65535文字以内で入力してください')
    end
  end

  context '評価が5以内の場合' do
    it '有効であること' do
      review = build(:review, rate: 3.5)
      expect(review).to be_valid
    end
  end

  context '評価が0以上の場合' do
    it '有効であること' do
      review = build(:review, rate: 0)
      expect(review).to be_valid
    end
  end

  context '評価が5以上の場合' do
    it '無効であること' do
      review = build(:review, rate: 5.1)
      expect(review).to be_invalid
      expect(review.errors[:rate]).to include('は5.0以下の値にしてください')
    end
  end

  context '評価が0未満の場合' do
    it '無効であること' do
      review = build(:review, rate: -1)
      expect(review).to be_invalid
      expect(review.errors[:rate]).to include('は0以上の値にしてください')
    end
  end
end
