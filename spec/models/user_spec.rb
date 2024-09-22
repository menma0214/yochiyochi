require 'rails_helper'

RSpec.describe User, type: :model do
  it 'ニックネーム、メールがあり、パスワードは3文字以上であれば有効であること' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'メールはユニークであること' do
    user1 = create(:user)
    user2 = build(:user)
    user2.email = user1.email
    user2.valid?
    expect(user2.errors[:email]).to include('メールアドレスはすでに使用されています')
  end

  it 'ニックネーム、メールアドレスが必須項目であること' do
    user = build(:user)
    user.name = nil
    user.email = nil
    user.valid?
    expect(user.errors[:name]).to include('を入力してください')
    expect(user.errors[:email]).to include('を入力してください')
  end


  it 'ニックネームは255文字以内であること' do
    user = build(:user)
    user.name = 'a' * 256
  end
end
