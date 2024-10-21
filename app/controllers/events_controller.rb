class EventsController < ApplicationController
  skip_before_action :require_login
  def index
    @search_type = 'events'
    @q = Event.ransack(params[:q])
    if params[:tag_id].present?
      @events = Event.joins(:tags).where(tags: {id: params[:tag_id]}).order(created_at: :desc).page(params[:page]).per(5)
    else
      @events = @q.result(distinct:true).order(created_at: :desc).page(params[:page]).per(5)
    end

    # 大人料金での検索
    if params[:price_range].present?
      min_price, max_price = params[:adult_fee_range].split('-').map(&:to_i)
      @events = @events.where(adult_fee: min_price..max_price)
    else
      @events = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
    end

    # 子供料金での検索
    if params[:child_fee_range].present?
      min_price, max_price = params[:child_fee_range].split('-').map(&:to_i)
      @events = @events.where(child_fee: min_price..max_price)
    end

    # 住所カラムに都道府県が含まれているか確認
    if params[:prefecture].present?
      @events = @events.where('address LIKE ?', "%#{params[:prefecture]}%")
    else
      @events = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
    end

    # タグの一覧を取得
    @tags = Tag.all
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
