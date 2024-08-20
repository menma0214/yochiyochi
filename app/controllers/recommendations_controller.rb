class RecommendationsController < ApplicationController

  def index
    @user = current_user
    @recommended_facilities = @user.recommended_facilities
    @recommended_events = @user.recommended_events
  end
end
