class RemoveNullConstraintFromReviews < ActiveRecord::Migration[7.1]
  def change
    change_column_null :reviews, :facility_id, true
    change_column_null :reviews, :event_id, true
  end
end
