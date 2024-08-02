class Admin::SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  layout 'admin/layouts/application'

  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to rails_admin_path, success: t('.success')
    else
      flash.now[:danger] = t('.failure')
      render :new
    end
  end
end
