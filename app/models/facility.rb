class Facility < ApplicationRecord
  has_many :playground_equipments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :place, dependent: :destroy

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  def self.ransackable_attributes(auth_object = nil)
    ["address", "business_hours", "contact", "created_at", "environment", "facility_url", "fee", "furigana", "id", "id_value", "image", "video", "name", "request", "target_age", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
