class FacilitiesController < ApplicationController
  skip_before_action :require_login
  before_action :require_login, only: %i[bookmarks]

  def index
    @q = Facility.ransack(params[:q])
    @facilities = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @facility = Facility.find(params[:id])
    @place = @facility.place
  end

  def bookmarks
    @q = current_user.bookmark_facilities.ransack(params[:q])
    @bookmark_facilities = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
  end
end
