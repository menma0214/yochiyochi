class Review < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  # belongs_to :event

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
end
