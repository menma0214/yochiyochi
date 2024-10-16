class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :facilities, through: :taggings, source: :taggable, source_type: 'Facility'
  has_many :events, through: :taggings, source: :taggable, source_type: 'Event'
end
