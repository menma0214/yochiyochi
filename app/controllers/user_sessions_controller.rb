class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]


  def new
  end

  def create
    # デバッグ用ログ出力
    Rails.logger.debug "Attempting to login with email: #{params[:email]}"

    # 該当ユーザーの検索
    @user = User.find_by(email: params[:email])

    # ユーザーが存在するか確認
    if @user.nil?
      Rails.logger.debug "No user found with email: #{params[:email]}"
    else
      Rails.logger.debug "User found: #{@user.inspect}"
    end

    # 退会済みユーザーかどうかチェック
    if @user&.deleted_at.present?
      Rails.logger.debug "User is deleted: #{@user.inspect}"
      flash.now[:danger] = 'このアカウントは退会済みです。'
      render :new, status: :unprocessable_entity
      return
    end

    # ログインを試みる
    @user = login(params[:email], params[:password])

    if @user
      Rails.logger.debug "Login successful for user: #{@user.inspect}"
      redirect_to tops_path, success: t('user_sessions.create.success')
    else
      Rails.logger.debug "Login failed for email: #{params[:email]}"
      flash.now[:danger] = t('user_sessions.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    #ログインユーザーの役割でログアウト遷移先を指定
    if current_user&.admin?
      logout
      redirect_to new_admin_session_path, danger: '管理者としてログアウトしました。'
    else
      logout
      redirect_to root_path, danger: 'ログアウトしました。'
    end
  end
end
