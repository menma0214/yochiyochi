class BookmarksController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @facility = Facility.find(params[:facility_id])
    current_user.bookmark(@facility)
  end

  def destroy
    @facility = current_user.bookmarks.find(params[:id]).facility
    current_user.unbookmark(@facility)
  end
end
