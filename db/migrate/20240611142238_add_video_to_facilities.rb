class AddVideoToFacilities < ActiveRecord::Migration[7.1]
  def change
    add_column :facilities, :video, :string
  end
end
