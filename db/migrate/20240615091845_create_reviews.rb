class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :facility, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.float :rate
      t.string :image

      t.timestamps
    end
  end
end
