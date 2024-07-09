class PlaygroundEquipment < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :facility
end
