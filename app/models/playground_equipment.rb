class PlaygroundEquipment < ApplicationRecord
  belongs_to :facility

  mount_uploader :image, ImageUploader
  mount_uploader :secondary_image, ImageUploader
  mount_uploader :tertiary_image, ImageUploader
  mount_uploader :video, VideoUploader

  validates :title, presence: true, length: {maximum: 255}
  validates :kind, presence: true, length: {maximum: 255}
  validates :target_age, presence: true
  validates :installation, presence: true
  validates :remarks, presence: true, length: {maximum: 65_535}
  validates :min_age, presence: true
  validates :max_age, presence: true
end
