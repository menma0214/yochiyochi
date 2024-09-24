FactoryBot.define do
  factory :bookmark do
    association :user
    association :bookmarkable, factory: :facility# ポリモーフィックな関連付け
  end
end
