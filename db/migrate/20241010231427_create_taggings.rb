class CreateTaggings < ActiveRecord::Migration[7.1]
  def change
    create_table :taggings do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :taggable, polymorphic: true, null: false # foreign_key: trueは特定のテーブルに依存しないため記述しない

      t.timestamps
    end
  end
end
