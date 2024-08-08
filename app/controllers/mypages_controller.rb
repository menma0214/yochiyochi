class MypagesController < ApplicationController
  before_action :set_user, only: %i[index show edit]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_path, notice: 'ユーザー情報が更新されました。'
    else
      flash[:alert] = 'ユーザー情報の更新に失敗しました。'
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :child_age, :child_sex, :child_personality, :child_trend)
  end
end
