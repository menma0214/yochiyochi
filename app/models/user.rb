class User < ApplicationRecord
  has_many :reviews
  authenticates_with_sorcery!

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }

  def own?(user)
    self == user
  end

end
