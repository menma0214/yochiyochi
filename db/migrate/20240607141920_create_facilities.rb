class CreateFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :facilities do |t|
      t.string :title
      t.string :name
      t.string :furigana
      t.string :address
      t.string :business_hours
      t.string :fee
      t.string :target_age
      t.string :environment
      t.text :request
      t.string :contact
      t.text :facility_url
      t.string :image
      t.string :movie

      t.timestamps
    end
  end
end
