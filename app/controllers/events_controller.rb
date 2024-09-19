class EventsController < ApplicationController
  skip_before_action :require_login
  def index
    @search_type = 'events'
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct:true).order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @event = Event.find(params[:id])
    @facility = @event.facility
    set_meta_tags(
      title: @event.title,
      keywords: "#{@event.name},#{@event.address},#{@event.target_age},#{@event.environment},#{@event.request}"
    )
  end

  def autocomplete
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).limit(10)

    render json: @events.as_json(only: [:id, :title, :name, :furigana, :address, :business_hours, :fee, :target_age, :environment, :request])
  end
end
