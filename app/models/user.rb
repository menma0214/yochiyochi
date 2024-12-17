class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_facilities, through: :bookmarks, source: :bookmarkable, source_type: 'Facility'
  has_many :bookmark_events, through: :bookmarks, source: :bookmarkable, source_type: 'Event'
  has_many :authentications, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :authentications
  attr_encrypted :email, key: ENV['ENCRYPTION_KEY']
  scope :active, -> { where(deleted_at: nil) }



  enum role: { general: 0, admin: 1 }

  def bookmark(bookmarkable)
    bookmarks.create!(bookmarkable: bookmarkable)
  end

  def unbookmark(bookmarkable)
    bookmarks.destroy(bookmarkable: bookmarkable)
  end

  def bookmark?(bookmarkable)
    bookmarks.include?(bookmarkable: bookmarkable)
  end

  # Sorceryのメソッドをカスタマイズ
  def active_for_authentication?
    # Sorceryの標準のメソッドが利用可能であることを確認する
    if respond_to?(:super)
      super && deleted_at.nil?
    else
      # Sorceryが期待する標準的なメソッドがない場合のカスタム実装
      !deleted_at.present?
    end
  end

  def inactive_message
    if deleted_at.present?
      :deleted_account
    else
      super
    end
  end

# おすすめのイベントと施設を取得するメソッド
def recommended_facilities
  Facility.joins(:tags).where("tags.name IN (?) AND min_age <= ? AND max_age >= ?", child_trend, child_age, child_age)
end

def recommended_events
  Event.joins(:tags).where("tags.name IN (?) AND min_age <= ? AND max_age >= ?", child_trend, child_age, child_age)
end

  validates :email, uniqueness: { scope: :deleted_at, message: "メールアドレスはすでに使用されています" }
  validates :email, presence: true
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  def own?(user)
    self == user
  end
end
