class AddReviewsableToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :reviewable, polymorphic: true, index: true
  end
end
