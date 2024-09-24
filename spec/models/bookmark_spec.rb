# spec/models/bookmark_spec.rb
require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  context '全てのフィールドが有効な場合' do
    it '有効であること' do
      facility = create(:facility)
      bookmark = build(:bookmark, bookmarkable: facility)
      expect(bookmark).to be_valid
    end
  end

  context '全てのフィールドが有効な場合' do
    it '有効であること' do
      event = create(:event)
      bookmark = build(:bookmark, bookmarkable: event)
      expect(bookmark).to be_valid
    end
  end

  context 'ユーザーと施設情報の組み合わせがユニークでない場合' do
    it '無効であること' do
      bookmark = create(:bookmark, bookmarkable: create(:facility))
      new_bookmark = build(:bookmark, user: bookmark.user, bookmarkable: bookmark.bookmarkable)#ポリモーフィック
      expect(new_bookmark).to be_invalid
    end
  end

  context 'ユーザーとイベント情報の組み合わせがユニークでない場合' do
    it '無効であること' do
      bookmark = create(:bookmark, bookmarkable: create(:event))
      new_bookmark = build(:bookmark, user: bookmark.user, bookmarkable: bookmark.bookmarkable)#ポリモーフィック
      expect(new_bookmark).to be_invalid
    end
  end
end
