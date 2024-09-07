class AddSecondaryImageAndtertiaryImageToPlayGroundEquipment < ActiveRecord::Migration[7.1]
  def change
    add_column :playground_equipments, :secondary_image, :string
    add_column :playground_equipments, :tertiary_image, :string
  end
end
