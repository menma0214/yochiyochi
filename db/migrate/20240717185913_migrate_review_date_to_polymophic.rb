class MigrateReviewDateToPolymophic < ActiveRecord::Migration[7.1]
  def up
    Review.reset_column_information

    Review.find_each do |review|
      if review.facility_id.present?
        review.update_columns(reviewable_id: review.facility_id, reviewable_type: 'Facility')
      elsif review.event_id.present?
        review.update_columns(reviewable_id: review.event_id, reviewable_type: 'Event')
      end
    end
  end

  def down
    Review.update_all(reviewable_id: nil, reviewable_type: nil)
  end
end
