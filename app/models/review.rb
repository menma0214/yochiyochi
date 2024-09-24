class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true
  # belongs_to :event

  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 255 }#本番時は30文字程度に調節する
  validates :body, presence: true, length: { maximum: 65_535 }
  validates :rate, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5.0 }
end
