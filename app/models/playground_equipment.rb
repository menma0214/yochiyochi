class PlaygroundEquipment < ApplicationRecord
  belongs_to :facility

  mount_uploader :image, ImageUploader
  mount_uploader :secondary_image, ImageUploader
  mount_uploader :tertiary_image, ImageUploader
  mount_uploader :video, VideoUploader
end
