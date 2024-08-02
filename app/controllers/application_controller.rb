class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :store_referrer


  # フラッシュメッセージを表示
  add_flash_types :success, :info, :warning, :danger

  public

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def store_referrer
    # リファラー（遷移元のページ）をセッションに保存
    if request.get? && request.referer.present?
      session[:previous_url] = request.referer
    end
  end

  def not_authenticated
    redirect_to main_app.login_path, danger: 'ログインしてください'
  end

  def logged_in?
    !!current_user
  end

  def require_admin
    unless logged_in? && current_user.admin?
      flash[:alert] = 'You must be an admin to access this page'
      redirect_to admin_login_path
    end
  end
end
