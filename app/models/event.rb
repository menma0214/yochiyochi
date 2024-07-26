class Event < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :facility
  has_many :reviews, :as => :reviewable, dependent: :destroy
  has_many :bookmarks, :as => :bookmarkable, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["address", "business_hours", "contact", "created_at", "environment", "facility_id", "fee", "furigana", "id", "id_value", "image", "name", "request", "target_age", "title", "updated_at", "video"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["facility"]
  end

  validates :title, presence: true, length: {maximum: 255}
  validates :name, presence: true
  validates :furigana, presence: true
  validates :address, presence: true
  validates :business_hours, presence: true
  validates :fee, presence: true
  validates :target_age, presence: true
  validates :environment, presence: true
  validates :request, presence: true, length: {maximum: 65_535}
  validates :contact, presence: true
end
