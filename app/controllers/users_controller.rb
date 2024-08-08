class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :require_login, only: [:withdraw, :destroy]

  def withdraw
    # 退会確認ページを表示
  end

  def new
    @user = User.new
  end

  def create
    # 既存のユーザーを検索
    @user = User.find_by(email: user_params[:email])

    if @user && @user.deleted_at.present?
      # 退会済みユーザーの場合、再登録のために削除済みフラグを解除する
      @user.update(user_params.merge(deleted_at: nil))
      if @user.save
        # 成功メッセージやリダイレクト処理
        redirect_to login_path, success: t('users.create.success')
      else
        # エラーメッセージや再表示処理
        flash.now[:danger] = t('users.create.failure')
        render :new, status: :unprocessable_entity
      end
    else
      # 新規ユーザー作成
      @user = User.new(user_params)
      if @user.save
        # 成功メッセージやリダイレクト処理
        redirect_to login_path, success: t('users.create.success')
      else
        # エラーメッセージや再表示処理
        flash.now[:danger] = t('users.create.failure')
        render :new, status: :unprocessable_entity
      end
    end
    # if @user.save
    #   redirect_to login_path, success: t('users.create.success')
    # else
    #   flash.now[:danger] = t('users.create.failure')
    #   render :new, status: :unprocessable_entity
    # end
  end

  # def update
  #   if @user.update(user_params)
  #     flash[:success] = t('users.flash_messages.updated', item: User.model_name.human)
  #     redirect_to mypage_path
  #   else
  #     flash[:danger] = t('users.flash_messages.not_updated', item: User.model_name.human)
  #     render edit_mypage_path, status: :unprocessable_entity
  #   end
  # end

  def destroy
    if current_user
      current_user.update(deleted_at: Time.current) # 退会処理
      logout # ログアウト処理
      redirect_to root_path, notice: '退会処理が完了しました。'
    else
      redirect_to root_path, alert: '退会処理に失敗しました。'
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    if @user.nil?
      Rails.logger.debug "No user found with id: #{params[:id]}"
      redirect_to root_path, alert: 'ユーザーが見つかりません' and return
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :child_age, :child_sex, :child_personality, :child_trend)
  end
end
