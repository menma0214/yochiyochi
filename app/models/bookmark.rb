class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :bookmarkable, polymorphic: true

  validates :bookmarkable_id, presence: true
  validates :bookmarkable_type, presence: true
  validates_uniqueness_of :bookmarkable_id, scope: [:user_id, :bookmarkable_type]
end
