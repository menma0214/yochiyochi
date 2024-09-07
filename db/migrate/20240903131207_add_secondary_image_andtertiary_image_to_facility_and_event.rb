class AddSecondaryImageAndtertiaryImageToFacilityAndEvent < ActiveRecord::Migration[7.1]
  def change
    add_column :facilities, :secondary_image, :string
    add_column :facilities, :tertiary_image, :string

    add_column :events, :secondary_image, :string
    add_column :events, :tertiary_image, :string
  end
end
