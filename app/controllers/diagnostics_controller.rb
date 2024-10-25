class DiagnosticsController < ApplicationController
  skip_before_action :require_login

  def step1
    # 質問1のページを表示
  end

  def step2
    session[:answer1] = params[:answer1]
    # 質問2のページを表示
  end

  def step3
    session[:answer2] = params[:answer2]
    # 質問3のページを表示
  end

  def step4
    session[:answer3] = params[:answer3]
    # 質問4のページを表示
  end

  def result
    session[:answer4] = params[:answer4]
    # 診断結果を計算（例：回答に基づいておすすめの施設やイベントを取得）

    #回答に基づいて一致するタグをを検索するために配列にして代入（例：各回答に関連するタグ名を取得）
    answers = [session[:answer1], session[:answer2], session[:answer3], session[:answer4]]

    #回答に基づいて一致するタグを持つ施設情報とイベント情報を検索する
    facilities = Facility.joins(:tags).where(tags: {name: answers}).distinct
    events = Event.joins(:tags).where(tags: {name: answers}).distinct

    results = (facilities || [] + events || [])
    @diagnostic_results = results.limit(5)
    # @diagnostic_results = Kaminari.paginate_array(results).page(params[:page]).per(5)
    # 診断結果のページを表示
  end
end
