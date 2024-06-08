class FacilitiesController < ApplicationController
  skip_before_action :require_login
  def index
    @q = Facility.ransack(params[:q])
    @facilities = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(20)
  end

  # def show
  #   # @fasility = Facility.find(params[:id])
  # end
end
