class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]


  def new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to tops_path, success: t('user_sessions.create.success')
    else
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
