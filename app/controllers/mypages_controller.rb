class MypagesController < ApplicationController
  before_action :set_user, only: %i[index show edit]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end



  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :child_age, :child_sex, :child_personality, :child_trend)
  end
end
