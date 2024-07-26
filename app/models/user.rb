class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_facilities, through: :bookmarks, source: :bookmarkable, source_type: 'Facility'
  has_many :bookmark_events, through: :bookmarks, source: :bookmarkable, source_type: 'Event'

  authenticates_with_sorcery!

  def bookmark(bookmarkable)
    bookmarks.create!(bookmarkable: bookmarkable)
  end

  def unbookmark(bookmarkable)
    bookmarks.destroy(bookmarkable: bookmarkable)
  end

  def bookmark?(bookmarkable)
    bookmarks.include?(bookmarkable: bookmarkable)
  end

  validates :email, uniqueness: true
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
