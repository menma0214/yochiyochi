class RecommendationsController < ApplicationController
  before_action :require_login, only: [:index]

  def index
    @recommended_facilities = current_user.recommended_facilities
    @recommended_events = current_user.recommended_events
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :child_age, :child_sex, :child_personality, :child_trend)
  end
end
