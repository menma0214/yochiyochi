class EventsController < ApplicationController
  skip_before_action :require_login
  def index
    @q = Event.ransack(params[:id])
    @events = @q.result(distinct:true).order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @event = Event.find(params[:id])
    @facility = Event.find(params[:id])
  end
end
