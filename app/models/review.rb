class Review < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  # belongs_to :event

  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 65_535 }
end
