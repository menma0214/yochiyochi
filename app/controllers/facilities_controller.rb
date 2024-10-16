class FacilitiesController < ApplicationController
  skip_before_action :require_login
  before_action :require_login, only: %i[bookmarks]

  def index
    @search_type = 'facilities'
    @q = Facility.ransack(params[:q])
    # 条件付きでページネーションを設定
    if params[:tag_id].present?
      @facilities = Facility.joins(:tags).where(tags: { id: params[:tag_id] }).order(created_at: :desc).page(params[:page]).per(5)
    else
      @facilities = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
    end

    # タグの一覧を取得
    @tags = Tag.all
  end

  def show
    @facility = Facility.find(params[:id])
    @place = @facility.place
    # メタタグ
    set_meta_tags(
      title: @facility.title,
      keywords: "#{@facility.name},#{@facility.address},#{@facility.target_age},#{@facility.environment},#{@facility.facility_url}"
    )
  end

  def bookmarks
    @q = current_user.bookmark_facilities.ransack(params[:q])
    @bookmark_facilities = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
  end

  def autocomplete
    @q = Facility.ransack(params[:q])
    @facilities = @q.result(distinct: true).limit(10)

    render json: @facilities.as_json(only: [:id, :title, :name, :furigana, :address, :business_hours, :fee, :target_age, :environment, :request])
  end
end
