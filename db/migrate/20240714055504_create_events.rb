class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :facility, null: false, foreign_key: true
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
      t.string :image
      t.string :video

      t.timestamps
    end
  end
end
