class FacilitiesController < ApplicationController
  skip_before_action :require_login
  def index
    @q = Facility.ransack(params[:q])
    @facilities = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @facility = Facility.find(params[:id])
    @place = @facility.place
  end
end
