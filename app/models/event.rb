class Event < ApplicationRecord
  belongs_to :facility
  has_many :reviews, :as => :reviewable, dependent: :destroy
  has_many :bookmarks, :as => :bookmarkable, dependent: :destroy

  mount_uploader :image, ImageUploader
  mount_uploader :secondary_image, ImageUploader
  mount_uploader :tertiary_image, ImageUploader
  mount_uploader :video, VideoUploader

  def self.ransackable_attributes(auth_object = nil)
    ["address", "business_hours", "contact", "created_at", "environment", "facility_id", "fee", "furigana", "id", "id_value", "image", "name", "request", "target_age", "title", "updated_at", "video"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["facility"]
  end

  validates :title, presence: true, length: {maximum: 255}
  validates :name, presence: true, length: {maximum: 255}
  validates :furigana, presence: true, length: {maximum: 255}
  validates :address, presence: true
  validates :business_hours, presence: true
  validates :fee, presence: true
  validates :target_age, presence: true
  validates :environment, presence: true
  validates :request, presence: true, length: {maximum: 65_535}
  validates :contact, presence: true
  validates :event_url, format: {with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message:'URLが正しくありません'}, presence: true
  validates :min_age, presence: true
  validates :max_age, presence: true
end
