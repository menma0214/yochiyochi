class DiagnosticsController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    if current_user.update(diagnostics_params)
      redirect_to complete_diagnostics_path, success: "診断結果を保存しました"
    else
      render :new, danger: "診断結果の保存に失敗しました"
    end
  end

  def complete
  end

  private

  def diagnostics_params
    params.require(:user).permit(:child_age, :child_sex, :child_personality, :child_trend)
  end
end
