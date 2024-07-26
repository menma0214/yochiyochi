class TopsController < ApplicationController
  skip_before_action :require_login
  def index
    # 施設とイベントの共通の検索オブジェクトを作成
    @q = Facility.ransack(params[:q])
    @facilities = @q.result(distinct: true).order(created_at: :desc)

    # イベントの検索オブジェクトを施設と同じ条件で作成
    @event_q = Event.ransack(params[:q])
    @events = @event_q.result(distinct: true).order(created_at: :desc)

    # 施設とイベントの検索結果を統合
    @results = (@facilities + @events).sort_by(&:created_at).reverse

    # 統合結果をページネーション
    @paginated_results = Kaminari.paginate_array(@results).page(params[:page]).per(5)
  end
end
