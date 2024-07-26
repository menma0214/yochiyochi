class AddEventIdToReviews < ActiveRecord::Migration[7.1]
  def change
    # reference型を使うときadd_columnではなく、下記になる
    add_reference :reviews, :event, null: false, foreign_key: true
  end
end
