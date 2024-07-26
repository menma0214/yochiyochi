class CleanupReviewableColumnsInReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :facility_id
    remove_column :reviews, :event_id

    change_column_null :reviews, :reviewable_id, false
    change_column_null :reviews, :reviewable_type, false
  end
end
