class CreatePlaygroundEquipments < ActiveRecord::Migration[7.1]
  def change
    create_table :playground_equipments do |t|
      t.references :facility, null: false, foreign_key: true
      t.string :title
      t.string :kind
      t.string :target_age
      t.string :installation
      t.text :remarks
      t.string :image
      t.string :video

      t.timestamps
    end
  end
end
